Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 021B765E4D2
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Jan 2023 05:46:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 88551F03F;
	Thu,  5 Jan 2023 05:45:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 88551F03F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672893991;
	bh=NAomTBdWv3ANxSes68XkxzVd+KZcT+ZC6Ar7d+E/auo=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=buj00khBYTr1HeLfBE+bJJJ+BIWwBs+rBfuO5FqN60t8LEjoMp28x9osY/ZIYFMCd
	 ZOxaQLdtExoERTeWlBWaDJihtdLrvrUkfHT3tTWb9EZc3Bz3oqG1Sv7R9sh8ugePcR
	 loY8JDhjJaFGqWxLsQ0i18SnVNx/gp8o6zTKv2Bg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D2234F80238;
	Thu,  5 Jan 2023 05:45:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 18601F804AD; Thu,  5 Jan 2023 05:45:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 568D5F80238
 for <alsa-devel@alsa-project.org>; Thu,  5 Jan 2023 05:45:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 568D5F80238
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=canonical.com header.i=@canonical.com
 header.a=rsa-sha256 header.s=20210705 header.b=hzhZi3dj
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 1C454418EA
 for <alsa-devel@alsa-project.org>; Thu,  5 Jan 2023 04:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1672893925;
 bh=sAARquCdiyoGI6YM6qFupFsPlCgGT8dmLud7FeaIzHw=;
 h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
 To:Cc:Content-Type;
 b=hzhZi3dj1dNNaKeMZ/aEGIPvxsDYOUF8lRyE3hYJ+MdCgveSfssM8wzU71j2FejqN
 PJqgrzQRrZR5+ilOv7raUWFRhVpM/fjzoVypQEcevUfX1+nZ9oajAWHHDTl2mPq1c3
 3Kvfjp183EgRzq59Wvjpox08KQDcCUM3SpcK4FaRxMgf+9kX/SBrkxCgl8rb6yOj1c
 JCSAsiPYoaofDQ3/pC7bRpDjKIM2cXyEyAEmDToQIhNGYW/na8iQnf+vwYuOvR4HXw
 RCCquRQr7sh0NBP+pIoH1j6LnprZzgvky3d9FHYhoY+ufC+7d8nxfWlvz+TQXuE9vK
 85wCmCrPHx1/Q==
Received: by mail-yb1-f199.google.com with SMTP id
 h66-20020a252145000000b0071a7340eea9so35467940ybh.6
 for <alsa-devel@alsa-project.org>; Wed, 04 Jan 2023 20:45:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sAARquCdiyoGI6YM6qFupFsPlCgGT8dmLud7FeaIzHw=;
 b=dhSCXG6dYhzKIEkKze4zdBnJxXStRCldo8rMXXdCoY2+ofeYOTwTKu6IbwPYI5L2pN
 NDfL0GK9Zo3+LjOnRDq2VRBx6aESyQTKKvkEws5b2KHNdlcux7QJhDoAIp+OzsJ/+wgG
 F4TV3XzL0BvEudJdb2TYohUK4PY9rmFv9p357xd+kvrpxkojuzRlRMlhBqwKzCnBukF5
 V98e3cEPGtO6ayDmGpYojRcCwQya9q109llxX4DcjvzoFd4TMQdaR3YllNllc4y6rmtW
 t0fnDmeYinU64TmuD1m1jURqHBnMFeArFeFQfPm06HjeLfjxvrRGCkartVqr7GCVAw8V
 k7+g==
X-Gm-Message-State: AFqh2kr4GYEI5E7qonYkMqVcufNN7kh2Vj/3YYpydGQ/FX7pO+J3UC/T
 lv1Mi1FtP5EjJr98H00eRfR0NLVJUb8uGZ/PSbnxxw8ExMfnJJ72sUNLWAOQiX13hcLiJCrJMdO
 XTUhNHluLyGky2/zFWQrx5rFMJ4sop8LScFzqw/5HmblDGWKkxr259riM
X-Received: by 2002:a25:7653:0:b0:6f9:13cc:de91 with SMTP id
 r80-20020a257653000000b006f913ccde91mr5835490ybc.328.1672893923351; 
 Wed, 04 Jan 2023 20:45:23 -0800 (PST)
X-Google-Smtp-Source: AMrXdXu0OSyLVt9ZvRyS7eU+hux8B4Yqs+UPDqmmVhk6DbIfN6oRf0pMQcay2ov2kLL0a/e61PTMgzfkTS9z2pFkBDg=
X-Received: by 2002:a25:7653:0:b0:6f9:13cc:de91 with SMTP id
 r80-20020a257653000000b006f913ccde91mr5835477ybc.328.1672893923027; Wed, 04
 Jan 2023 20:45:23 -0800 (PST)
MIME-Version: 1.0
References: <20230105044154.8242-1-jeremy.szu@canonical.com>
In-Reply-To: <20230105044154.8242-1-jeremy.szu@canonical.com>
From: Jeremy Szu <jeremy.szu@canonical.com>
Date: Thu, 5 Jan 2023 12:44:49 +0800
Message-ID: <CAKzWQkwJ==-BS2wB-21RWaX5vbaphsOjEC5SFq3oNpV7b_JjNg@mail.gmail.com>
Subject: Re: [PATCH] ALSA: hda/realtek: fix mute/micmute LEDs don't work for a
 HP platform
To: tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Stefan Binding <sbinding@opensource.cirrus.com>,
 Lucas Tanure <tanureal@opensource.cirrus.com>,
 Yuchi Yang <yangyuchi66@gmail.com>, Meng Tang <tangmeng@uniontech.com>,
 Philipp Jungkamp <p.jungkamp@gmx.net>, Tim Crawford <tcrawford@system76.com>,
 "moderated list:SOUND" <alsa-devel@alsa-project.org>,
 Kai-Heng Feng <kai.heng.feng@canonical.com>,
 =?UTF-8?Q?Kacper_Michaj=C5=82ow?= <kasper93@gmail.com>,
 open list <linux-kernel@vger.kernel.org>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Besides this, it has the problem described in
https://lore.kernel.org/all/20220719144753.252231-1-kai.heng.feng@canonical.com/
but the solution could seperate with this quirk.

On Thu, Jan 5, 2023 at 12:42 PM Jeremy Szu <jeremy.szu@canonical.com> wrote:
>
> There is a HP platform uses ALC236 codec which using GPIO2 to control
> mute LED and GPIO1 to control micmute LED.
> Thus, add a quirk to make them work.
>
> Signed-off-by: Jeremy Szu <jeremy.szu@canonical.com>
> ---
>  sound/pci/hda/patch_realtek.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
> index eda4914b8aeb..8362eb4642d8 100644
> --- a/sound/pci/hda/patch_realtek.c
> +++ b/sound/pci/hda/patch_realtek.c
> @@ -9409,6 +9409,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
>         SND_PCI_QUIRK(0x103c, 0x8ad2, "HP EliteBook 860 16 inch G9 Notebook PC", ALC245_FIXUP_CS35L41_SPI_2_HP_GPIO_LED),
>         SND_PCI_QUIRK(0x103c, 0x8b5d, "HP", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF),
>         SND_PCI_QUIRK(0x103c, 0x8b5e, "HP", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF),
> +       SND_PCI_QUIRK(0x103c, 0x8bf0, "HP", ALC236_FIXUP_HP_GPIO_LED),
>         SND_PCI_QUIRK(0x1043, 0x103e, "ASUS X540SA", ALC256_FIXUP_ASUS_MIC),
>         SND_PCI_QUIRK(0x1043, 0x103f, "ASUS TX300", ALC282_FIXUP_ASUS_TX300),
>         SND_PCI_QUIRK(0x1043, 0x106d, "Asus K53BE", ALC269_FIXUP_LIMIT_INT_MIC_BOOST),
> --
> 2.38.1
>


-- 
Sincerely,
Jeremy Su
