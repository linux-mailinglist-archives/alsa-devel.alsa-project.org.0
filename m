Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0060D4EC96E
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Mar 2022 18:16:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8F4721887;
	Wed, 30 Mar 2022 18:15:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8F4721887
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648656972;
	bh=b0AyqVB1oKTLJHMRCRnyV2JQz3E+jsXsvdxPFkQuRVY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BUEJSxhrmOoWOrodlUNf5AsAfWiCCUuZvrVcjfZ5iWhpARQokQzzFlESKfmAJVXbl
	 iVAeI0gy0UfaxJHXZ+wlFoKc3Lg921PAiTzYCLFqo5AWlVQsHoFSoWxUtX9AFMMAWy
	 F1Na81H8ALFLB2hB/okz9mNy5lV/8BkjxEj3+RpA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E3449F800B8;
	Wed, 30 Mar 2022 18:15:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C6F23F80254; Wed, 30 Mar 2022 18:15:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY
 autolearn=disabled version=3.4.0
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 071FEF80155
 for <alsa-devel@alsa-project.org>; Wed, 30 Mar 2022 18:15:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 071FEF80155
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com
 header.b="IkXp7YLL"
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id 16E381F45D79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1648656899;
 bh=b0AyqVB1oKTLJHMRCRnyV2JQz3E+jsXsvdxPFkQuRVY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IkXp7YLLbwEGMTNIGKu1Wmcyn3FrmqCJymAolDdizOH0Qi3JJeAiLJVh30Xbqrx0O
 CCWbxYSfWhivoN2A/vo91tfKEKTi5hb/q0rQlfsjVEINng46NNfyM494yLZgFp+T6q
 ymuAwSZiWjhDFZL1WmgedlIsNpBRl3Xz9WMKM/IGmzY+zbh32fqAO7I7oBskvbdNcY
 kt8d/YcpEDu8aQUM8Nm+mULHgyKhiiKyW+5nlZWI8rQwHXIeOcnUUloQ595W+RCwg+
 sjpK5RZGKg9/71NcL40P5FBueF6GX6anecvM+GcMPpTCk8eiDGb8GiygmOy/nqjPut
 KfUPnV2Y0wb1A==
Date: Wed, 30 Mar 2022 12:14:50 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
Subject: Re: [v7 2/4] ASoC: mediatek: mt8192: refactor for I2S3 DAI link of
 speaker
Message-ID: <20220330161450.xxak64el6g6lzcem@notapiano>
References: <20220324064511.10665-1-jiaxin.yu@mediatek.com>
 <20220324064511.10665-3-jiaxin.yu@mediatek.com>
 <20220329223002.uo7kiemopkh7ak4x@notapiano>
 <dee3fbb7c9f0c3e1f11143db1d6fc4381cab827f.camel@mediatek.com>
 <YkRNSoBKFvYYyZLu@sirena.org.uk>
 <61e9fb59448837cfc8e3ec862b711294bcb68872.camel@mediatek.com>
 <YkRoC30JLDMeVi1B@sirena.org.uk>
 <734fbf254c64668856e987aafe9d7dfd3ec86941.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <734fbf254c64668856e987aafe9d7dfd3ec86941.camel@mediatek.com>
Cc: devicetree@vger.kernel.org, linmq006@gmail.com, alsa-devel@alsa-project.org,
 robh+dt@kernel.org, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, tzungbi@google.com,
 Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org,
 trevor.wu@mediatek.com, Tzung-Bi Shih <tzungbi@kernel.org>,
 matthias.bgg@gmail.com, aaronyu@google.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
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

On Wed, Mar 30, 2022 at 11:48:01PM +0800, Jiaxin Yu wrote:
> On Wed, 2022-03-30 at 15:24 +0100, Mark Brown wrote:
> > On Wed, Mar 30, 2022 at 10:06:24PM +0800, Jiaxin Yu wrote:
> > > On Wed, 2022-03-30 at 13:30 +0100, Mark Brown wrote:
> > > > Making a previously optional property required means that systems
> > > > that
> > > > previously worked may stop working unless they update their DT,
> > > > DTs
> > > > may
> > > > be distributed separately to the kernel and perhaps even baked
> > > > into
> > > > firmware or similar.
> > > Thank you for your detailed answer. I should keep the driver's
> > > behavior
> > > consistent with the description of dt-bindings. The "mediatek,hdmi-
> > > codec" needs to be set as the required property. Is my
> > > understanding
> > > right?
> > 
> > The binding document and code should match so if one is changed the
> > other needs to be changed too.
> > 
> > In theory we should never change a previously optional property to
> > required which would mean that the code should be updated to reflect
> > the
> > binding document, however sometimes the DT isn't actually used as a
> > stable intereface by anything for a given property or device type so
> > we
> > can get away with changing things.
> 
> "however sometimes the DT isn't actually used as a stable intereface by
> anything for a given property or device type so we can get away with
> changing things."
> 
> Sorry, I don't understand the real idea of this description. Does it
> mean that dt-bindings in this series don't need to be updated, but the
> driver?

He means that usually the DT (and dt-binding) shouldn't be changed to avoid
incompatibilities, but sometimes it's OK to change them. For example if there
are no users of the DT yet.

But in any case, like I mentioned in my latest reply [1], I don't think changing
the dt-binding is the proper solution in this case. The driver should be changed
instead.

Thanks,
Nícolas

[1] https://lore.kernel.org/all/20220330152026.6nuigsldx46lue44@notapiano
