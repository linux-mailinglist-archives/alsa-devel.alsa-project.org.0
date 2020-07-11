Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AE2221C3DE
	for <lists+alsa-devel@lfdr.de>; Sat, 11 Jul 2020 13:10:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C72FC1662;
	Sat, 11 Jul 2020 13:09:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C72FC1662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594465813;
	bh=C2uujy66xXZvNFTF3Q3KTtXGIEyWte9JojtAPPsDisM=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Y6aAZawNIb1u7uO28LBAviBdJMpmoUwpY4g4YFz6PRcAp7CYOUCbsqjqOCPY6X6SD
	 CquzBXfBNT1FF1rz20JttdbFecd9qD19dI6dzZOZ7R5fI7hvGsZGXVwIozloKHwH+I
	 tFGdWfZFHGjMxxG5hTdzFVU16txQZEj/U4FtWZWQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E51FCF80216;
	Sat, 11 Jul 2020 13:08:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 066A8F80216; Sat, 11 Jul 2020 13:08:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.bin-co.de (mail.bin-co.de [IPv6:2a02:c207:3002:169::2])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4E451F80084
 for <alsa-devel@alsa-project.org>; Sat, 11 Jul 2020 13:08:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4E451F80084
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=retarded.farm header.i=@retarded.farm
 header.b="ClB+T7TA"; 
 dkim=pass (2048-bit key) header.d=retarded.farm header.i=@retarded.farm
 header.b="QMPL4eGb"
Received: from localhost (localhost [127.0.0.1])
 by mail.bin-co.de (Postfix) with ESMTP id 4EFBA4443EB0;
 Sat, 11 Jul 2020 13:08:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=retarded.farm;
 s=201801; t=1594465703;
 bh=C2uujy66xXZvNFTF3Q3KTtXGIEyWte9JojtAPPsDisM=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=ClB+T7TAOjVWd/Ak54N7famCDHKVz0SI34FZ8k2ydwg5Eb5DFcsnfWe9z2wZaWMvP
 NheIVV8TR21YD4pNJmRfSndZGpQFP0c6F3yhKRK0cSf89fwJBHGStX13qQaSxUt4M4
 BLywD42CkYu6limlwf4aE7e/lfM3iSh28bVhheaa6Dx82a0A1JM1m+j9VMaXb/9tD8
 SFC+8mdhzM9yVuajdHmnw6EiBd1FRHNCAGg9F6DxP20BI08h1e/xfTrtHi3sdZm/82
 5b5fLoHhsd5i9jnVBxbmH6zFOH3a0Err8o5b8AJSnT2+UYN0W0R2xXt4CJr4Jps1Qo
 CEqtM2/tZ8R1g==
X-Virus-Scanned: amavisd-new at bin-co.de
Received: from mail.bin-co.de ([127.0.0.1])
 by localhost (mail.bin-co.de [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GC2roZb__aUN; Sat, 11 Jul 2020 13:08:22 +0200 (CEST)
Received: from deepblue.zlan.intra (unknown [90.187.13.225])
 (Authenticated sender: zappel@retarded.farm)
 by mail.bin-co.de (Postfix) with ESMTPSA id 3D41A4443DAB;
 Sat, 11 Jul 2020 13:08:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=retarded.farm;
 s=201801; t=1594465702;
 bh=C2uujy66xXZvNFTF3Q3KTtXGIEyWte9JojtAPPsDisM=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=QMPL4eGbFr54NGBebMcllyyiC4wvsq5asCTNn1SAu5YaJQr19N8DBVEXoQaUf8zoW
 815D3MyCqXEevm2+c5n8+JtkRqhA8JMaTfSHkK0sj1gk7vXjhaqdFlLEEbfQBpe9WX
 82eJX9KPNgt/J6bumoLix4PlM0pDsarUGLzDoUkHWtqJBaxxRLG5o3ZrvS+5rQDYro
 wL99H3hxmUkKRZ0o8Qu1ErC7i0btjEoQ2Yed3QBXCyxjmzdauVNihsvbWGFEAqDBgp
 5QdOXS1NCC2eBcLoTfLhkGEwTmkqMO1nJgp1o4E39ODKBiYZXIwdo9GWAV9BXaFQwz
 giYT6F8eQX+bA==
Message-ID: <175a3cb31aeddef707f75d8935b16ff1249fa4d2.camel@retarded.farm>
Subject: Re: [PATCH v2] ALSA: hda/realtek: enable headset mic of ASUS ROG
 Zephyrus G14(G401) series with ALC289
From: Armas Spann <zappel@retarded.farm>
To: Takashi Iwai <tiwai@suse.de>
Date: Sat, 11 Jul 2020 13:08:19 +0200
In-Reply-To: <s5hk0za2w07.wl-tiwai@suse.de>
References: <20200711101111.13983-1-zappel@retarded.farm>
 <s5hk0za2w07.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, tiwai@suse.com
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

Am Samstag, den 11.07.2020, 12:20 +0200 schrieb Takashi Iwai:
> On Sat, 11 Jul 2020 12:11:11 +0200,
> Armas Spann wrote:
> > Signed-off-by: Armas Spann <
> > zappel@retarded.farm
> > >
> 
> Could you give a bit more detail about what you've fixed?
> An empty patch description is always a bad sign.
> 
> 
> thanks,
> 
> Takashi
> 
> > ---
> >  sound/pci/hda/patch_realtek.c | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> > 
> > diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
> > index 194ffa8c66ce..ff4f3eeedfd0 100644
> > --- a/sound/pci/hda/patch_realtek.c
> > +++ b/sound/pci/hda/patch_realtek.c
> > @@ -6152,6 +6152,7 @@ enum {
> >  	ALC269VC_FIXUP_ACER_VCOPPERBOX_PINS,
> >  	ALC269VC_FIXUP_ACER_HEADSET_MIC,
> >  	ALC269VC_FIXUP_ACER_MIC_NO_PRESENCE,
> > +	ALC289_FIXUP_ASUS_G401,
> >  };
> >  
> >  static const struct hda_fixup alc269_fixups[] = {
> > @@ -7359,6 +7360,13 @@ static const struct hda_fixup alc269_fixups[] = {
> >  		.chained = true,
> >  		.chain_id = ALC269_FIXUP_HEADSET_MIC
> >  	},
> > +	[ALC289_FIXUP_ASUS_G401] = {
> > +		.type = HDA_FIXUP_PINS,
> > +		.v.pins = (const struct hda_pintbl[]) {
> > +			{ 0x19, 0x03a11020 }, /* headset mic with jack detect */
> > +			{ }
> > +		},
> > +	},
> >  };
> >  
> >  static const struct snd_pci_quirk alc269_fixup_tbl[] = {
> > @@ -7539,6 +7547,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] =
> > {
> >  	SND_PCI_QUIRK(0x1043, 0x1bbd, "ASUS Z550MA",
> > ALC255_FIXUP_ASUS_MIC_NO_PRESENCE),
> >  	SND_PCI_QUIRK(0x1043, 0x1c23, "Asus X55U",
> > ALC269_FIXUP_LIMIT_INT_MIC_BOOST),
> >  	SND_PCI_QUIRK(0x1043, 0x1ccd, "ASUS X555UB", ALC256_FIXUP_ASUS_MIC),
> > +	SND_PCI_QUIRK(0x1043, 0x1f11, "ASUS Zephyrus G14",
> > ALC289_FIXUP_ASUS_G401),
> >  	SND_PCI_QUIRK(0x1043, 0x3030, "ASUS ZN270IE",
> > ALC256_FIXUP_ASUS_AIO_GPIO2),
> >  	SND_PCI_QUIRK(0x1043, 0x831a, "ASUS P901", ALC269_FIXUP_STEREO_DMIC),
> >  	SND_PCI_QUIRK(0x1043, 0x834a, "ASUS S101", ALC269_FIXUP_STEREO_DMIC),
> > -- 
> > 2.27.0
> > 

I'd just resend it (as v3) and added a "changelog" and "description" to the
patch, I hope I did it correct. (sorry I'm totally new to this)


Best Regards,Armas Spann

