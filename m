Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D4F45BA877
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Sep 2022 10:48:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B9E5F1A22;
	Fri, 16 Sep 2022 10:47:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B9E5F1A22
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663318096;
	bh=nZfKuZkRLwDeAdEaBc46rOYnY8b1DKqIyPPrctrI3rY=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HMdun5lFSeUuV5qTdiiFNgUKgSyH4duA1esc2J+/RHbRwo74SYKmueDFUn2gDWStI
	 l5c5XoRFy2OiYOpxCxV5Mg4bMO30ppTfT2mCa8aKyvkDBRzgZIj1ZtDa7jcWmaaDUy
	 EJI9M+b1PEdLepMF4qBhyw7kzJ+EU8Z3Oo/30Lmk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 42D06F80254;
	Fri, 16 Sep 2022 10:47:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DE915F802BE; Fri, 16 Sep 2022 10:47:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 64EC8F8024C
 for <alsa-devel@alsa-project.org>; Fri, 16 Sep 2022 10:47:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 64EC8F8024C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev
 header.b="OCQ7m7Jj"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="kaw0jP++"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id EE9613200AC5;
 Fri, 16 Sep 2022 04:47:04 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Fri, 16 Sep 2022 04:47:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1663318024; x=
 1663404424; bh=nZfKuZkRLwDeAdEaBc46rOYnY8b1DKqIyPPrctrI3rY=; b=O
 CQ7m7Jj05lCtmcpLpzOzNmesDd4rflUM1GKnd09RF7QY94I9T2kxaxEs+5ayY/yQ
 3EYgjbB+cfXUup8oQj8o5HfrML1t/KbkrdPHOcvMAurSF06b419u8wUtlAziZ/TJ
 4ReyqKugAhDwGB1iOPPb5v1ADKG9kpkqMyrziKkchr0PLy++zBfkTBLFJyWBmrs/
 FM2SA9uO7TCaLgW0sLb6mpwixdAO+y05ycTwRwXJiBng0YlFLPAvuOaQSVhx0S/+
 nhzYiKGI+1JrjvGcJd0C1NggQ7zmLjjkK7F5X3UvxxBUUn8Kn7Qzd0aW43l5GEv1
 1/hEZ8kXoVHU3wy6rPTsw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1663318024; x=
 1663404424; bh=nZfKuZkRLwDeAdEaBc46rOYnY8b1DKqIyPPrctrI3rY=; b=k
 aw0jP++/Wu/SgxX2+mE3/OPnH4DJVrlzCWXCE9we1ObegnAp9eetYvbHR++fXYvj
 0Nl/zKbpE1w9gDo5gENpBLDQvUBvy2TvaC/6L7eyh8hJFh8/4l7R2ecKX8gBm7rJ
 ylwUQSRVCF2Zf1ZYWO4MPEmYLeX1Hw+/S4ZGHu9Zgw3k/OJCvCrrNPxtxoTmoacA
 4w9DpdQnPxzFGMX+ksjO6MizM9QFRMMgjiuJCRAf/pWXv0C0wVLkdLHhqmqz0zAV
 G492zMyFl2mOrZk41WPyVr00Vq7CNgVilvItnSQrPiZufChcN+o6T63BZbsS4uAH
 YmHqmQMyurEyrGruUZCyQ==
X-ME-Sender: <xms:BzgkY5BkYzm4W1PjiBTZUe_wlRNlCttqdHjFTzMhfN43rRbSnCDnQA>
 <xme:BzgkY3hNYZjb9oKZ3E7zsUULRtMaIxdFeobZvTqHkrcCFP2ebJzCdFWOi4ejV1Oaq
 e-vobwfC0dYZQygIQE>
X-ME-Received: <xmr:BzgkY0kkCL8QxLpGPJSrSZKpJ7hC3YNZnJrV6CCDvkqJDwq3Bl82AKJZQsZLFIpFdc-06A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfedvtddgtdelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepkffuhffvveffjghftgfgfgggsehtqhertddtreejnecuhfhrohhmpefnuhhk
 vgculfhonhgvshcuoehluhhkvgeslhhjohhnvghsrdguvghvqeenucggtffrrghtthgvrh
 hnpeekfeffueejveeujeeugeelleehtdegvdeludektddtfffhieefledvudehfeejieen
 ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehluhhkvg
 eslhhjohhnvghsrdguvghv
X-ME-Proxy: <xmx:BzgkYzx1QK3IDHEmBqsRM55WpmBl8iZi3DVjmuGQs-dd9mghocZrRA>
 <xmx:BzgkY-SWWQWM7fBXVptYwc0AExEuABXy5b1gsGJVy53X11qxtsMgDQ>
 <xmx:BzgkY2azzBeoERa5QFnAA9lzHDO36_AvUL-p8upPMcrjK9IUgv_sHg>
 <xmx:CDgkY5ccA30LUgfSUudoMM3TUbpP5MSCMQ2ILoLLIb_FA6Pk_Z_Xlg>
Feedback-ID: i5ec1447f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 16 Sep 2022 04:47:00 -0400 (EDT)
Message-ID: <850ba9d69e23be788f1963f46c348f7fdf8806cd.camel@ljones.dev>
Subject: Re: [PATCH v2 0/3] sound: realtek: add quirks for ASUS G513, G533Z,
 GA503R
From: Luke Jones <luke@ljones.dev>
To: Takashi Iwai <tiwai@suse.de>
Date: Fri, 16 Sep 2022 20:46:52 +1200
In-Reply-To: <87fsgsvdfq.wl-tiwai@suse.de>
References: <20220915080921.35563-1-luke@ljones.dev>
 <87fsgsvdfq.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.45.3 (by Flathub.org)) 
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, tiwai@suse.com, linux-kernel@vger.kernel.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Thanks Takashi,

On Thu, 2022-09-15 at 17:56 +0200, Takashi Iwai wrote:
> On Thu, 15 Sep 2022 10:09:18 +0200,
> Luke D. Jones wrote:
> >=20
> > This series adds quirks to fix pincfg for the ASUS ROG G513 and
> > G533Z laptops, and adds a mapping
> > for the ASUS ROG GA503R to use the previous G15/G14 quirks which
> > fix the DAC mapping.
> >=20
> > Changelog:
> > V2:
> > - Use smallcaps in hex string
> > - Chain the G533Z quirk with the G513 quirk as they use the same
> > base pincfg
> > - Add the quirk for GA503R series to use GA401 quirk
> >=20
> > Luke D. Jones (3):
> > =C2=A0 sound: realtek: Add pincfg for ASUS G513 HP jack
> > =C2=A0 sound: realtek: Add pincfg for ASUS G533Z HP jack
> > =C2=A0 sound: realtek: Add quirk for ASUS GA503R laptop
>=20
> Now applied all patches, but I corrected the positions of the new
> entries to be in the SSID order locally.=C2=A0 Also, the subject lines ar=
e
> adjusted to "ALSA:" prefix.
>=20

I'll try to remember this next time. There's bound to be a few more
with next generation of these laptops.

>=20
> thanks,
>=20
> Takashi

