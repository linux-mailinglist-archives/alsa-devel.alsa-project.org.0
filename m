Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C2ED6F6269
	for <lists+alsa-devel@lfdr.de>; Thu,  4 May 2023 02:42:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AAE47170B;
	Thu,  4 May 2023 02:41:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AAE47170B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683160960;
	bh=CG7cjl+RTHK7qwfvPTfXfNDsJLShJ75SV5qY9gL9R74=;
	h=Date:From:Subject:To:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PE/Ez7Dm0TlQpHrFJLjBHhnxybkEyoSyMI40yOV7Y3qLoDoXRQmL1c54jHoqS6VwJ
	 IHjCi6KJE6qxWce8//mlTyeqoWVraEzJVuYHsnEMzFRtRegBbr1CWGbkJK77rAC5qe
	 F+9GnvbWkNvrXxs4ugIa6Ar83J2jQwO3ujCEGCBg=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E9ABCF80114;
	Thu,  4 May 2023 02:41:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BDE3DF8049E; Thu,  4 May 2023 02:41:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D97D0F800EC
	for <alsa-devel@alsa-project.org>; Thu,  4 May 2023 02:41:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D97D0F800EC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=ljones.dev header.i=@ljones.dev header.a=rsa-sha256
 header.s=fm1 header.b=T6ZfHQhs;
	dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=TDekByPZ
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 016735C026B;
	Wed,  3 May 2023 20:41:31 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Wed, 03 May 2023 20:41:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1683160890; x=1683247290; bh=Wh
	UV0l8/rjHDLwkMVOzmkF9d+1HvMPc48i2JyNsR/tE=; b=T6ZfHQhsXfaB3ZQK3b
	g4oOY7rb9xWmYbC0c4eYIUtaUZjFDZlIUuzoch7hhqM5eYmAhKvJ43noNWFFce69
	CmDAgxVeDHJuJM6TrSzDIFVkKQWT/qaSrX6/WQ6BPiF/6U7GwN0Kc31y/aqbltDq
	uxqW4iLtlIp4fs4K4lz6uEyxrXl4QjdB7J5GX9ShaHbq3H+NLp4aUfXNOxZ0AjY2
	Z+/rS7o6amq0bfYybyNxq5/JkUKCxt7VX8TUd5o7bkIkUEfANgR76m3phjSiXsci
	Kl7RUM/obq7oNQBQXkNp7OdtBZHgTMdL1Npl0g3y9dI5ttuO/fhdkRVobVo0cDF/
	KNAw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1683160890; x=1683247290; bh=WhUV0l8/rjHDL
	wkMVOzmkF9d+1HvMPc48i2JyNsR/tE=; b=TDekByPZSF4GPV3dp0jEKAPy1J3Aj
	JGqIbGPfoJr5KEP4O9vD+cujjD1fyrZVJZxEuTkti/JAuqdpy0/ayKRK+QRIqoOR
	QbBjvJRH7hsDQAA0F+w8yeogiH+jYNCGcVJQ0ViXuaJWfIu2QMXjYp0y53C+il8h
	TDoBKrJnMN7TknheuQyaUQK9JwflzhScg1oConqiBTREtzhyvVDekQs0UduI/Dwn
	aJaNi3dU7+rLH17LEBVFyfzE6DlJeQVDIS/efd8sc1exg2UoYLab9yTZB8/Qn2st
	WAdMiZCVxvbmZAwtwuiUjRM303rUu3z007fvhrRacNps307cW+Kbff/hA==
X-ME-Sender: <xms:Of9SZFxAGnIFvz3ZMj9_kQ5XeWkecdAnp2Eaa88H9E9kuYGTJszI9Q>
    <xme:Of9SZFQrxo9VmCsp43E50wxK-Tunza7ny3FKuhH2PkpgZIAM9jpa28_HCoCeQ6kfR
    ov7l5nBwTP9XNuyBwQ>
X-ME-Received: 
 <xmr:Of9SZPVCHgMh4UpgeAsCtDam3Vov7gzEVlwJURchpHtdFFugKJxfC4OjGRPr3UbKghss4g>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvhedrfedvledgfeejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhuffvvefkjghfofggtgesthdtredtredtvdenucfhrhhomhepnfhukhgv
    ucflohhnvghsuceolhhukhgvsehljhhonhgvshdruggvvheqnecuggftrfgrthhtvghrnh
    epvddvgeeltdehfeeijefgveegfeeihfdtveetfeetudfhvedtfeeltefhteegledunecu
    vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheplhhukhgvse
    hljhhonhgvshdruggvvh
X-ME-Proxy: <xmx:Of9SZHgMyvh8jkN_s69MIFtkhuTniBsopW8hvFpzG_H_fCftSax08A>
    <xmx:Of9SZHDjHkBtjvOnmM5hgVZEblmsPZUdWsuIuAjvfBdut9OWwYJqrg>
    <xmx:Of9SZAITpFkifO-7wNa0GBhN6ScsXfnLIe-YTrk2DJvnczeYCzzfaQ>
    <xmx:Ov9SZKPuOJ8WuVc188e87tgRGE0Ka9KmIg5laQoT2ivBi3Mh2280ew>
Feedback-ID: i5ec1447f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 3 May 2023 20:41:24 -0400 (EDT)
Date: Thu, 04 May 2023 12:41:09 +1200
From: Luke Jones <luke@ljones.dev>
Subject: Re: [PATCH] ALSA: hda/realtek: Add quirk for 2nd ASUS GU603
To: Takashi Iwai <tiwai@suse.de>
Message-Id: <L8Z3UR.OO4MSH3SX5VD3@ljones.dev>
In-Reply-To: <87h6sune0i.wl-tiwai@suse.de>
References: <20230503035035.254346-1-luke@ljones.dev>
	<87h6sune0i.wl-tiwai@suse.de>
X-Mailer: geary/43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Message-ID-Hash: KD6TK3SAURCH7T7NMI54T5GBLHWWQVLQ
X-Message-ID-Hash: KD6TK3SAURCH7T7NMI54T5GBLHWWQVLQ
X-MailFrom: luke@ljones.dev
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org, tiwai@suse.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KD6TK3SAURCH7T7NMI54T5GBLHWWQVLQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On Wed, May 3 2023 at 08:08:13 +0200, Takashi Iwai <tiwai@suse.de> 
wrote:
> On Wed, 03 May 2023 05:50:35 +0200,
> Luke D. Jones wrote:
>> 
>>  Add quirk for GU603 with 0x1c62 variant of codec.
>> 
>>  Signed-off-by: Luke D. Jones <luke@ljones.dev>
>>  ---
>>   sound/pci/hda/patch_realtek.c | 1 +
>>   1 file changed, 1 insertion(+)
>> 
>>  diff --git a/sound/pci/hda/patch_realtek.c 
>> b/sound/pci/hda/patch_realtek.c
>>  index 3b9f077a227f..4a585050edc3 100644
>>  --- a/sound/pci/hda/patch_realtek.c
>>  +++ b/sound/pci/hda/patch_realtek.c
>>  @@ -9501,6 +9501,7 @@ static const struct snd_pci_quirk 
>> alc269_fixup_tbl[] = {
>>   	SND_PCI_QUIRK(0x1043, 0x1517, "Asus Zenbook UX31A", 
>> ALC269VB_FIXUP_ASUS_ZENBOOK_UX31A),
>>   	SND_PCI_QUIRK(0x1043, 0x1662, "ASUS GV301QH", 
>> ALC294_FIXUP_ASUS_DUAL_SPK),
>>   	SND_PCI_QUIRK(0x1043, 0x16b2, "ASUS GU603", 
>> ALC289_FIXUP_ASUS_GA401),
>>  +	SND_PCI_QUIRK(0x1043, 0x1c62, "ASUS GU603", 
>> ALC289_FIXUP_ASUS_GA401),
>>   	SND_PCI_QUIRK(0x1043, 0x16e3, "ASUS UX50", 
>> ALC269_FIXUP_STEREO_DMIC),
>>   	SND_PCI_QUIRK(0x1043, 0x1740, "ASUS UX430UA", 
>> ALC295_FIXUP_ASUS_DACS),
>>   	SND_PCI_QUIRK(0x1043, 0x17d1, "ASUS UX431FL", 
>> ALC294_FIXUP_ASUS_DUAL_SPK),
> 
> Could you try to put the new entry at the right place?
> The table is sorted in the PCI SSID order.
> 
> 
> thanks,
> 
> Takashi

Sure no problem. Sorry, seems I read `0x1c62` and `0x16c2` :(


