Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 679DE4A3E9C
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Jan 2022 09:30:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D8E921684;
	Mon, 31 Jan 2022 09:29:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D8E921684
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643617836;
	bh=pzBBzUVblElYhohG6YAHECebGDWiecUp5NWhMIzTVc0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rciFch9rIzwAK2Jzu/4Fno5NY8WXfU8FyoTCvQPSDFtgtYy2I2pgXvvasZDnO6c9l
	 SwjWOJxXxP1Pw2+Zi4lxT1m2r3A98G5hBOK1NsRU5giJHnAILFTDBXTwEM+UQsR958
	 8ocTAgwnc1f9TDd7YgFubsEcw1p2jwRuH3ws3YVA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2FA17F800FF;
	Mon, 31 Jan 2022 09:29:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 93ECFF8028B; Mon, 31 Jan 2022 09:29:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 72DBFF80095
 for <alsa-devel@alsa-project.org>; Mon, 31 Jan 2022 09:29:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 72DBFF80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.b="pexQbDkB"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 00D5EB829D7;
 Mon, 31 Jan 2022 08:29:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41B26C340E8;
 Mon, 31 Jan 2022 08:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1643617746;
 bh=pzBBzUVblElYhohG6YAHECebGDWiecUp5NWhMIzTVc0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pexQbDkBtqJwbMtfdwahwcdsKVZwctx4153Lme5sPhUCWsc0AyfFteK3c657Cdgs8
 zdxxDdTugbhJIiAxTLhpYS+HvZ2FgHRT/0/McclZryA54HEXmbrmJApgM+XQnYNfYW
 vAY0m+xzhrD2xhQUF6zJrxPLOJTXUZ7hofkM4JPY=
Date: Mon, 31 Jan 2022 07:40:14 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Albert Geanta <albertgeanta@gmail.com>
Subject: Re: [PATCH] ALSA: hda/realtek: Add quirk for ASUS GU603
Message-ID: <YfeETp1AKeek7zwj@kroah.com>
References: <20220131010523.546386-1-albertgeanta@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220131010523.546386-1-albertgeanta@gmail.com>
Cc: alsa-devel@alsa-project.org, stable@vger.kernel.org
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

On Mon, Jan 31, 2022 at 03:05:23AM +0200, Albert Geanta wrote:
> The ASUS GU603 (Zephyrus M16 - SSID 1043:16b2) requires a quirk similar to
> other ASUS devices for correctly routing the 4 integrated speakers. This
> fixes it by adding a corresponding quirk entry, which connects the bass
> speakers to the proper DAC.
> 
> Signed-off-by: Albert Geantă <albertgeanta@gmail.com>
> ---
>  sound/pci/hda/patch_realtek.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
> index 668274e52674..61b314c7dbc9 100644
> --- a/sound/pci/hda/patch_realtek.c
> +++ b/sound/pci/hda/patch_realtek.c
> @@ -8969,6 +8969,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
>  	SND_PCI_QUIRK(0x1043, 0x1e51, "ASUS Zephyrus M15", ALC294_FIXUP_ASUS_GU502_PINS),
>  	SND_PCI_QUIRK(0x1043, 0x1e8e, "ASUS Zephyrus G15", ALC289_FIXUP_ASUS_GA401),
>  	SND_PCI_QUIRK(0x1043, 0x1f11, "ASUS Zephyrus G14", ALC289_FIXUP_ASUS_GA401),
> +	SND_PCI_QUIRK(0x1043, 0x16b2, "ASUS GU603", ALC289_FIXUP_ASUS_GA401),
>  	SND_PCI_QUIRK(0x1043, 0x3030, "ASUS ZN270IE", ALC256_FIXUP_ASUS_AIO_GPIO2),
>  	SND_PCI_QUIRK(0x1043, 0x831a, "ASUS P901", ALC269_FIXUP_STEREO_DMIC),
>  	SND_PCI_QUIRK(0x1043, 0x834a, "ASUS S101", ALC269_FIXUP_STEREO_DMIC),
> -- 
> 2.35.1
> 

<formletter>

This is not the correct way to submit patches for inclusion in the
stable kernel tree.  Please read:
    https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
for how to do this properly.

</formletter>
