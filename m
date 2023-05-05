Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F0E5B6F8CF7
	for <lists+alsa-devel@lfdr.de>; Sat,  6 May 2023 02:01:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6A12C27B7;
	Sat,  6 May 2023 02:00:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6A12C27B7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683331281;
	bh=+6MZ4q1YpSdjNOPbpkr1LxWlB9yc4HU7MIoAW7ZduK8=;
	h=Date:From:Subject:To:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=q2OWP7zsa55CkoDw9CRKlSKIvYhevg6Z+1xqqKjaKJqoI5h4YWKEmXCLvWsuS5IyU
	 LnbmpbECgs+9+lgLzb+yv7WbmGmXN28i4P75Io3AQj1z/GulfRiXNgEwQ/barwGPHa
	 oisFA2vAb5xfuQRyfLsUD9AsEdlOFpOj9VJMNhdk=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0E6C8F80529;
	Sat,  6 May 2023 02:00:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 16A15F8052D; Sat,  6 May 2023 02:00:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D00B1F80087
	for <alsa-devel@alsa-project.org>; Sat,  6 May 2023 02:00:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D00B1F80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=ljones.dev header.i=@ljones.dev header.a=rsa-sha256
 header.s=fm2 header.b=kwFzADU6;
	dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=El2efMC0
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.west.internal (Postfix) with ESMTP id 6069132009C8;
	Fri,  5 May 2023 20:00:16 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Fri, 05 May 2023 20:00:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1683331215; x=1683417615; bh=+E
	HGl6UIEJr2mYgMnf4UBP4D5+0Gvo5H618eeD5wk4k=; b=kwFzADU6IH0eOjaLEp
	CBLtDD2fkyU4BQ7VLurCa0VAZncUb5EGnM5VGPbBMWbjnb4FIcQpLCMNLXt4XQzU
	hF7SBbHXFynrmfncg4vlcxFJMTMNz5Q7FYp3jCl8Nc04ZG4cA/sGxZujAiSi+0A5
	RVD9snX8wZFEoGpJcHJ2Y+bok920Izu+eW1wCL0qAhupSIo1FsOT1ZynOz3EyzyO
	qDPikeHOqKYAYTHBZmk4JiIuL0QapwxLp/VQvRT8v3xw5FsgUKMNAwo4bontibeR
	oJ0w7zZqqJsZ49pNIBAF91vce5PyvIENZVt7Ua8o8qkc3Sa9jLSK3m3HRE7JWSJG
	6tCg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1683331215; x=1683417615; bh=+EHGl6UIEJr2m
	YgMnf4UBP4D5+0Gvo5H618eeD5wk4k=; b=El2efMC0Dy0nnub3kQF65f5yP+ogk
	A8V3J99HPT3E3TmlnecNPnBNMc8YiCVoJwuE7FZi/1yc77ol4kYdjAabbcQ6U0M3
	92laCh+pFVHURiMvkIiVio3SvXAuDA5Xo/hhtyVSI74f0j5+JBMp+rnjbdKSdczp
	f3oCR2co5jmAa39OZOqYKKn8Mpszx4RC1EcFtI76q3qR2rOW6tdp9eKy1beKkRTo
	xbzuQ7PsqVGjaRqTrlAAO7hPmMX1Y2BBGm8EiryqNpEDxlzZA/BuZYe36kDzRdIP
	3sulgdWlAJogG5wd4N9s9q4H86xKy0YnTONmNmd+1Uwto2a/pFFqbL3ZQ==
X-ME-Sender: <xms:j5hVZDQw-ZHOJxkw0D8BvskdWPWMSi5I2dmno7lsURvkobbliCaGLA>
    <xme:j5hVZExaTthxu3GpyEcR05PbgbI6_6-bwRp30aJ8-pzPeQk7LOZaWGUU6Fc5mUDhm
    a7fRRWqFdeAFVoFkaI>
X-ME-Received: 
 <xmr:j5hVZI0S7ZtNDvpIoNF8DvrkvcYa046wm6jkauzCDgUT3xth1-w_tZvxKjjpDpdebWH0gg>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvhedrfeeffedgvdelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhuffvvefkjghfofggtgesthdtredtredtvdenucfhrhhomhepnfhukhgv
    ucflohhnvghsuceolhhukhgvsehljhhonhgvshdruggvvheqnecuggftrfgrthhtvghrnh
    epvddvgeeltdehfeeijefgveegfeeihfdtveetfeetudfhvedtfeeltefhteegledunecu
    vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheplhhukhgvse
    hljhhonhgvshdruggvvh
X-ME-Proxy: <xmx:j5hVZDAAeweZKePUSJDrOuYXponq0SJoTqoLTZoQ_sUy4LYeTBk-Iw>
    <xmx:j5hVZMj4Dbrt1LifcutxlJIV4AcwWq9nZmGm2MAGOok2xh9tvGmFfw>
    <xmx:j5hVZHo5vQ4lQ88C80HGsQ5xoMqCpTuvRAH6X4gSV-01ddqV_OMdiw>
    <xmx:j5hVZPtWBJN24GvKuDA6KOCg2ViSNuZMbAyrkuZOFG5H8-PhDyjSrw>
Feedback-ID: i5ec1447f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 May 2023 20:00:10 -0400 (EDT)
Date: Sat, 06 May 2023 11:59:56 +1200
From: Luke Jones <luke@ljones.dev>
Subject: Re: [PATCH] ALSA: hda/realtek: Add quirk for 2nd ASUS GU603
To: Takashi Iwai <tiwai@suse.de>
Message-Id: <WNM7UR.C0XH9EHBJ0ID2@ljones.dev>
In-Reply-To: <87a5yiizcj.wl-tiwai@suse.de>
References: <20230503035035.254346-1-luke@ljones.dev>
	<87h6sune0i.wl-tiwai@suse.de> <L8Z3UR.OO4MSH3SX5VD3@ljones.dev>
	<87a5yiizcj.wl-tiwai@suse.de>
X-Mailer: geary/43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Message-ID-Hash: W7GAJO66AIW43TABK4ENSYIZZT46SOQZ
X-Message-ID-Hash: W7GAJO66AIW43TABK4ENSYIZZT46SOQZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/W7GAJO66AIW43TABK4ENSYIZZT46SOQZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On Fri, May 5 2023 at 17:15:24 +0200, Takashi Iwai <tiwai@suse.de> 
wrote:
> On Thu, 04 May 2023 02:41:09 +0200,
> Luke Jones wrote:
>> 
>>  On Wed, May 3 2023 at 08:08:13 +0200, Takashi Iwai <tiwai@suse.de>
>>  wrote:
>>  > On Wed, 03 May 2023 05:50:35 +0200,
>>  > Luke D. Jones wrote:
>>  >>
>>  >>  Add quirk for GU603 with 0x1c62 variant of codec.
>>  >>
>>  >>  Signed-off-by: Luke D. Jones <luke@ljones.dev>
>>  >>  ---
>>  >>   sound/pci/hda/patch_realtek.c | 1 +
>>  >>   1 file changed, 1 insertion(+)
>>  >>
>>  >>  diff --git a/sound/pci/hda/patch_realtek.c
>>  >> b/sound/pci/hda/patch_realtek.c
>>  >>  index 3b9f077a227f..4a585050edc3 100644
>>  >>  --- a/sound/pci/hda/patch_realtek.c
>>  >>  +++ b/sound/pci/hda/patch_realtek.c
>>  >>  @@ -9501,6 +9501,7 @@ static const struct snd_pci_quirk
>>  >> alc269_fixup_tbl[] = {
>>  >>   	SND_PCI_QUIRK(0x1043, 0x1517, "Asus Zenbook UX31A",
>>  >> ALC269VB_FIXUP_ASUS_ZENBOOK_UX31A),
>>  >>   	SND_PCI_QUIRK(0x1043, 0x1662, "ASUS GV301QH",
>>  >> ALC294_FIXUP_ASUS_DUAL_SPK),
>>  >>   	SND_PCI_QUIRK(0x1043, 0x16b2, "ASUS GU603",
>>  >> ALC289_FIXUP_ASUS_GA401),
>>  >>  +	SND_PCI_QUIRK(0x1043, 0x1c62, "ASUS GU603",
>>  >> ALC289_FIXUP_ASUS_GA401),
>>  >>   	SND_PCI_QUIRK(0x1043, 0x16e3, "ASUS UX50",
>>  >> ALC269_FIXUP_STEREO_DMIC),
>>  >>   	SND_PCI_QUIRK(0x1043, 0x1740, "ASUS UX430UA",
>>  >> ALC295_FIXUP_ASUS_DACS),
>>  >>   	SND_PCI_QUIRK(0x1043, 0x17d1, "ASUS UX431FL",
>>  >> ALC294_FIXUP_ASUS_DUAL_SPK),
>>  >
>>  > Could you try to put the new entry at the right place?
>>  > The table is sorted in the PCI SSID order.
>>  >
>>  >
>>  > thanks,
>>  >
>>  > Takashi
>> 
>>  Sure no problem. Sorry, seems I read `0x1c62` and `0x16c2` :(
> 
> So, which number is correct?  Isn't it 0x16c2?  This sounds more
> reasonable.
> 
> In anyway, please resubmit a proper patch after confirming that it's
> really working.
> 
> 
> thanks,
> 
> Takashi

0x1c62 is the correct hex, I've submitted V2 with the line in the right 
order.


