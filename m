Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CA1E27E71B1
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Nov 2023 19:49:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E22F83E;
	Thu,  9 Nov 2023 19:48:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E22F83E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699555751;
	bh=NCXbenS1L3Qe6e/ss5KgHEU40eBHqXGrOb2hVPXVeDI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PcLQIYmE6aWP6/37aPYjqic9i3bM4M3KXbsLaFhd4eJwLei3Krry4T/Z7H2y42TL6
	 PHiDsp6NWIYBob01ciuYCS9ZdYUzFxVzKgCW2RdTzwQHa9V2tz3IO0xudUj31AQUmd
	 MefmN0kV9vOZgUZ+CWTDMQNCXkwOmA2o2/KkSzLs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 54F49F8055B; Thu,  9 Nov 2023 19:48:21 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8BB63F80125;
	Thu,  9 Nov 2023 19:48:20 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2880FF80169; Thu,  9 Nov 2023 14:33:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5E4C6F80152
	for <alsa-devel@alsa-project.org>; Thu,  9 Nov 2023 14:33:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5E4C6F80152
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=ZuDfHmFI
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-9d0b4dfd60dso136611166b.1
        for <alsa-devel@alsa-project.org>;
 Thu, 09 Nov 2023 05:33:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699536814; x=1700141614;
 darn=alsa-project.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=f6vvIDiFOvQlW7b+j+gCsKL4XHEcs023e878kBSn+io=;
        b=ZuDfHmFIFAJhXQbQ6v3jkq6l9lpdwEJGU+n3Tllis8r8KuqjebWGKAUIW+yYCdhlKi
         aUBzmz0cC8bu4mwugyUPXDKGLuxhZJ8S5uJc3LmdNEWnNnVE2qQ4AeNM7yf9K8zLfMeN
         gxoXu6fLMIcc51pRaACjxwggcBlcYUXTgIXB6WnK4rXC2z7CS3UhDlJHlKYIC6RCr5IO
         9aEA8WbiOoelKqamEN5sIPshxueC/3LmLQa5346xDW+p6/krkQg13Bwo82veRNtTy2gD
         qVZwChXZdi3LGM++1bOMQHtfClaOb9nt9S7SYOgAO20TA9+CLcMJFeTuJp1AewrShPB4
         o0Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699536814; x=1700141614;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f6vvIDiFOvQlW7b+j+gCsKL4XHEcs023e878kBSn+io=;
        b=mwA7wPdj44UYJzNJdI8LkMVdmRuL4UY5+b9RIKH2TDtrA27HRe885SMaFDRNjMRcfy
         3S4AfcHN1BBtLfc6DFfmlfOL25pFXySnbiaKYY/Q1BZTJNDp60LJASfi5RYhG+ik5uqZ
         uYJlT6faDtVMiAHWyRB0XI7Butk+NXFbD+PhllpMR48fFDe2pWv/PYECmcLvXGye79pH
         r7tTd4nyYCxdxHXnh2n+cT8+X1Mte8iL8vhwXItA8tuOCU8FERJQ4Ey0SVZpo+vczHNy
         F59su6MtMyf+RrPD+jUbLxUY5DANk6juLjY4r5QTyPtBP02w1j00k2XKqbYic7Awz8By
         hyNg==
X-Gm-Message-State: AOJu0Yzeg+ebbGFak/ehrXkrNy2c6y0uPHJbN8wjP4snRL7Ct9zVOEt8
	ub3CDUA1bPW5fHwYIO3pDRF8XZgyhmF7qEYDuA==
X-Google-Smtp-Source: 
 AGHT+IH/pQPsu4jcr4tPiNAagFyu34m7Rys8x5jjWc7qYt85ck0AdZfXDbHfo6yB+hjcnrkkGLjt1T/MNU1aM4RcHzc=
X-Received: by 2002:a17:907:d1f:b0:9e2:af56:c375 with SMTP id
 gn31-20020a1709070d1f00b009e2af56c375mr4621158ejc.52.1699536814141; Thu, 09
 Nov 2023 05:33:34 -0800 (PST)
MIME-Version: 1.0
References: 
 <CAHiQ-bDGx89vWjtqrnH4FtO-JF9XUWMgwCpR4nusC9Zvw=bN7Q@mail.gmail.com>
 <87sf5fpe7j.wl-tiwai@suse.de>
In-Reply-To: <87sf5fpe7j.wl-tiwai@suse.de>
From: "vitaly.torshyn@gmail.com" <vitaly.torshyn@gmail.com>
Date: Thu, 9 Nov 2023 15:33:21 +0200
Message-ID: 
 <CAHiQ-bA-vhk4vhxUGRVk7dLrDECmjqA38C=jSj7iYHr=RL+0TQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] ALSA: HDA: Asus UM5302LA: Added quirks for
 cs35L41/10431A83 on i2c bus
To: Takashi Iwai <tiwai@suse.de>
Cc: perex@perex.cz, alsa-devel@alsa-project.org
Content-Type: multipart/mixed; boundary="0000000000001705ae0609b840b7"
X-MailFrom: vitaly.torshyn@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: P3VSC3FMZ4BVGJU4FOSDJGOPHZLD2YRD
X-Message-ID-Hash: P3VSC3FMZ4BVGJU4FOSDJGOPHZLD2YRD
X-Mailman-Approved-At: Thu, 09 Nov 2023 18:48:16 +0000
X-Content-Filtered-By: Mailman/MimeDel 3.3.8
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/P3VSC3FMZ4BVGJU4FOSDJGOPHZLD2YRD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

--0000000000001705ae0609b840b7
Content-Type: text/plain; charset="UTF-8"

Dear Takashi,

Thanks a lot for the quick review.
My idea was to keep "similar" devices' quirks close to each other but I do
agree that using PCI SSID makes more sense.

Please find the updated version of the patch attached.

Vitalii
---
diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 58006c8bc..a28d078c9 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -7444,6 +7444,7 @@ enum {
       ALC287_FIXUP_THINKPAD_I2S_SPK,
       ALC287_FIXUP_MG_RTKC_CSAMP_CS35L41_I2C_THINKPAD,
       ALC2XX_FIXUP_HEADSET_MIC,
+       ALC294_FIXUP_CS35L41_I2C_2
};

/* A special fixup for Lenovo C940 and Yoga Duet 7;
@@ -9552,6 +9553,11 @@ static const struct hda_fixup alc269_fixups[] = {
               .type = HDA_FIXUP_FUNC,
               .v.func = alc_fixup_headset_mic,
       },
+       [ALC294_FIXUP_CS35L41_I2C_2] = {
+               .type = HDA_FIXUP_FUNC,
+               .v.func = cs35l41_fixup_i2c_two,
+       },
+
};

static const struct snd_pci_quirk alc269_fixup_tbl[] = {
@@ -9913,6 +9919,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[]
= {
       SND_PCI_QUIRK(0x1043, 0x19e1, "ASUS UX581LV",
ALC295_FIXUP_ASUS_MIC_NO_PRESENCE),
       SND_PCI_QUIRK(0x1043, 0x1a13, "Asus G73Jw",
ALC269_FIXUP_ASUS_G73JW),
       SND_PCI_QUIRK(0x1043, 0x1a30, "ASUS X705UD", ALC256_FIXUP_ASUS_MIC),
+       SND_PCI_QUIRK(0x1043, 0x1a83, "ASUS UM5302LA",
ALC294_FIXUP_CS35L41_I2C_2),
       SND_PCI_QUIRK(0x1043, 0x1a8f, "ASUS UX582ZS",
ALC245_FIXUP_CS35L41_SPI_2),
       SND_PCI_QUIRK(0x1043, 0x1b11, "ASUS UX431DA",
ALC294_FIXUP_ASUS_COEF_1B),
       SND_PCI_QUIRK(0x1043, 0x1b13, "Asus U41SV", ALC269_FIXUP_INV_DMIC),




On Thu, 9 Nov 2023 at 09:40, Takashi Iwai <tiwai@suse.de> wrote:

> On Thu, 09 Nov 2023 01:22:57 +0100,
> vitaly.torshyn@gmail.com wrote:
> >
> >
> > Hi Takashi,
> >
> > Proposed patch fixes initialization of CSC3551 on the UM5302LA laptop.
> > Patching DSDT table is not required since ASUS did added _DSD entry.
> > Nothing new introduced but reused work started by Stefan B.
> >
> > Currently there is no official firmware available for 10431A83 on cirrus
> git
> > unfortunately.
> > For testing used 104317f3 (which is also seems on i2c bus):
> >
> > $ cd /lib/firmware/cirrus/ && \
> > for fw in $(find ./ -name '*104317f3*'); do newfw=$(echo $fw | sed
> 's/104317f3
> > /10431a83/g'); echo echo "$fw -> $newfw"; ln -s $f $newfw; done
> >
> > With the patch applied to 6.6.0 and obviously symlinks to 104317F3 FW,
> > speakers works and to my susrprise they sound quite good and loud without
> > distortion.
> >
> > Probably confirmation from cirrus team is needed on firmware.
> >
> > Signed-off-by: Vitalii Torshyn <vitaly.torshyn@gmail.com>
>
> Thanks for the patch.
> The change looks almost fine, but only one thing:
>
> > @@ -9937,6 +9943,7 @@ static const struct snd_pci_quirk
> alc269_fixup_tbl[] = {
> >       SND_PCI_QUIRK(0x1043, 0x1c52, "ASUS Zephyrus G15 2022",
> ALC289_FIXUP_ASUS_GA401),
> >       SND_PCI_QUIRK(0x1043, 0x1f11, "ASUS Zephyrus G14",
> ALC289_FIXUP_ASUS_GA401),
> >       SND_PCI_QUIRK(0x1043, 0x1f12, "ASUS UM5302",
> ALC287_FIXUP_CS35L41_I2C_2),
> > +     SND_PCI_QUIRK(0x1043, 0x1a83, "ASUS UM5302LA",
> ALC294_FIXUP_CS35L41_I2C_2),
>
> The entry is sorted in PCI SSID order.  Please put at the right
> position.
>
>
> thanks,
>
> Takashi
>

--0000000000001705ae0609b840b7
Content-Type: text/x-patch; charset="US-ASCII";
	name="0002-Subject-PATCH-ALSA-HDA-Asus-UM5302LA-Added-quirks-fo.patch"
Content-Disposition: attachment;
	filename="0002-Subject-PATCH-ALSA-HDA-Asus-UM5302LA-Added-quirks-fo.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_lor8afdq0>
X-Attachment-Id: f_lor8afdq0

RnJvbSA4YzY0MzJlNzlmNTY2OWE3ZWQ0ODA2OWRiMGE5MmVkZDY5ZDJiMDk1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBWaXRhbGlpIFRvcnNoeW4gPHZpdGFseS50b3JzaHluQGdtYWls
LmNvbT4KRGF0ZTogVGh1LCA5IE5vdiAyMDIzIDAxOjEzOjU0ICswMjAwClN1YmplY3Q6IFtQQVRD
SCAxLzFdIEFMU0E6IEhEQTogQXN1cyBVTTUzMDJMQTogQWRkZWQgcXVpcmtzIGZvciBjczM1TDQx
LzEwNDMxQTgzIG9uIGkyYyBidXMKVG86IHRpd2FpQHN1c2UuZGUKQ2M6IHBlcmV4QHBlcmV4LmN6
LGFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpNSU1FLVZlcnNpb246IDEuMApDb250ZW50LVR5
cGU6IG11bHRpcGFydC9taXhlZDsgYm91bmRhcnk9Ii0tLS0tLS0tLS0tLWFsc2EtaGRhLWNzMzVs
NDEtYXN1cy11bTUzMDJsYS1maXgucGF0Y2giCgpUaGlzIGlzIGEgbXVsdGktcGFydCBtZXNzYWdl
IGluIE1JTUUgZm9ybWF0LgotLS0tLS0tLS0tLS0tLWFsc2EtaGRhLWNzMzVsNDEtYXN1cy11bTUz
MDJsYS1maXgucGF0Y2gKQ29udGVudC1UeXBlOiB0ZXh0L3BsYWluOyBjaGFyc2V0PVVURi04OyBm
b3JtYXQ9Zml4ZWQKQ29udGVudC1UcmFuc2Zlci1FbmNvZGluZzogOGJpdApIaSBUYWthc2hpLAoK
UHJvcG9zZWQgcGF0Y2ggZml4ZXMgaW5pdGlhbGl6YXRpb24gb2YgQ1NDMzU1MSBvbiB0aGUgVU01
MzAyTEEgbGFwdG9wLgpQYXRjaGluZyBEU0RUIHRhYmxlIGlzIG5vdCByZXF1aXJlZCBzaW5jZSBB
U1VTIGRpZCBhZGRlZCBfRFNEIGVudHJ5LgpOb3RoaW5nIG5ldyBpbnRyb2R1Y2VkIGJ1dCByZXVz
ZWQgd29yayBzdGFydGVkIGJ5IFN0ZWZhbiBCLgoKQ3VycmVudGx5IHRoZXJlIGlzIG5vIG9mZmlj
aWFsIGZpcm13YXJlIGF2YWlsYWJsZSBmb3IgMTA0MzFBODMgb24gY2lycnVzIGdpdCB1bmZvcnR1
bmF0ZWx5LgpGb3IgdGVzdGluZyB1c2VkIDEwNDMxN2YzICh3aGljaCBpcyBhbHNvIHNlZW1zIG9u
IGkyYyBidXMpOgoKJCBjZCAvbGliL2Zpcm13YXJlL2NpcnJ1cy8gJiYgXApmb3IgZncgaW4gJChm
aW5kIC4vIC1uYW1lICcqMTA0MzE3ZjMqJyk7IGRvIG5ld2Z3PSQoZWNobyAkZncgfCBzZWQgJ3Mv
MTA0MzE3ZjMvMTA0MzFhODMvZycpOyBlY2hvIGVjaG8gIiRmdyAtPiAkbmV3ZnciOyBsbiAtcyAk
ZiAkbmV3Znc7IGRvbmUKCldpdGggdGhlIHBhdGNoIGFwcGxpZWQgdG8gNi42LjAgYW5kIG9idmlv
dXNseSBzeW1saW5rcyB0byAxMDQzMTdGMyBGVywgc3BlYWtlcnMgd29ya3MgYW5kIHRvIG15IHN1
c3JwcmlzZSB0aGV5IHNvdW5kIHF1aXRlIGdvb2QgYW5kIGxvdWQgd2l0aG91dCBkaXN0b3J0aW9u
LgoKUHJvYmFibHkgY29uZmlybWF0aW9uIGZyb20gY2lycnVzIHRlYW0gaXMgbmVlZGVkIG9uIGZp
cm13YXJlLgoKU2lnbmVkLW9mZi1ieTogVml0YWxpaSBUb3JzaHluIDx2aXRhbHkudG9yc2h5bkBn
bWFpbC5jb20+Ci0tLQogc291bmQvcGNpL2hkYS9wYXRjaF9yZWFsdGVrLmMgfCA3ICsrKysrKysK
IDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKykKCgotLS0tLS0tLS0tLS0tLWFsc2EtaGRh
LWNzMzVsNDEtYXN1cy11bTUzMDJsYS1maXgucGF0Y2gKQ29udGVudC1UeXBlOiB0ZXh0L3gtcGF0
Y2g7IG5hbWU9IjAwMDEtU3ViamVjdC1QQVRDSC1BTFNBLUhEQS1Bc3VzLVVNNTMwMkxBLUFkZGVk
LXF1aXJrcy1mby5wYXRjaCIKQ29udGVudC1UcmFuc2Zlci1FbmNvZGluZzogOGJpdApDb250ZW50
LURpc3Bvc2l0aW9uOiBhdHRhY2htZW50OyBmaWxlbmFtZT0iMDAwMS1TdWJqZWN0LVBBVENILUFM
U0EtSERBLUFzdXMtVU01MzAyTEEtQWRkZWQtcXVpcmtzLWZvLnBhdGNoIgoKZGlmZiAtLWdpdCBh
L3NvdW5kL3BjaS9oZGEvcGF0Y2hfcmVhbHRlay5jIGIvc291bmQvcGNpL2hkYS9wYXRjaF9yZWFs
dGVrLmMKaW5kZXggNTgwMDZjOGJjLi5hMjhkMDc4YzkgMTAwNjQ0Ci0tLSBhL3NvdW5kL3BjaS9o
ZGEvcGF0Y2hfcmVhbHRlay5jCisrKyBiL3NvdW5kL3BjaS9oZGEvcGF0Y2hfcmVhbHRlay5jCkBA
IC03NDQ0LDYgKzc0NDQsNyBAQCBlbnVtIHsKIAlBTEMyODdfRklYVVBfVEhJTktQQURfSTJTX1NQ
SywKIAlBTEMyODdfRklYVVBfTUdfUlRLQ19DU0FNUF9DUzM1TDQxX0kyQ19USElOS1BBRCwKIAlB
TEMyWFhfRklYVVBfSEVBRFNFVF9NSUMsCisJQUxDMjk0X0ZJWFVQX0NTMzVMNDFfSTJDXzIKIH07
CiAKIC8qIEEgc3BlY2lhbCBmaXh1cCBmb3IgTGVub3ZvIEM5NDAgYW5kIFlvZ2EgRHVldCA3OwpA
QCAtOTU1Miw2ICs5NTUzLDExIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgaGRhX2ZpeHVwIGFsYzI2
OV9maXh1cHNbXSA9IHsKIAkJLnR5cGUgPSBIREFfRklYVVBfRlVOQywKIAkJLnYuZnVuYyA9IGFs
Y19maXh1cF9oZWFkc2V0X21pYywKIAl9LAorCVtBTEMyOTRfRklYVVBfQ1MzNUw0MV9JMkNfMl0g
PSB7CisJCS50eXBlID0gSERBX0ZJWFVQX0ZVTkMsCisJCS52LmZ1bmMgPSBjczM1bDQxX2ZpeHVw
X2kyY190d28sCisJfSwKKwogfTsKIAogc3RhdGljIGNvbnN0IHN0cnVjdCBzbmRfcGNpX3F1aXJr
IGFsYzI2OV9maXh1cF90YmxbXSA9IHsKQEAgLTk5MTMsNiArOTkxOSw3IEBAIHN0YXRpYyBjb25z
dCBzdHJ1Y3Qgc25kX3BjaV9xdWlyayBhbGMyNjlfZml4dXBfdGJsW10gPSB7CiAJU05EX1BDSV9R
VUlSSygweDEwNDMsIDB4MTllMSwgIkFTVVMgVVg1ODFMViIsIEFMQzI5NV9GSVhVUF9BU1VTX01J
Q19OT19QUkVTRU5DRSksCiAJU05EX1BDSV9RVUlSSygweDEwNDMsIDB4MWExMywgIkFzdXMgRzcz
SnciLCBBTEMyNjlfRklYVVBfQVNVU19HNzNKVyksCiAJU05EX1BDSV9RVUlSSygweDEwNDMsIDB4
MWEzMCwgIkFTVVMgWDcwNVVEIiwgQUxDMjU2X0ZJWFVQX0FTVVNfTUlDKSwKKwlTTkRfUENJX1FV
SVJLKDB4MTA0MywgMHgxYTgzLCAiQVNVUyBVTTUzMDJMQSIsIEFMQzI5NF9GSVhVUF9DUzM1TDQx
X0kyQ18yKSwKIAlTTkRfUENJX1FVSVJLKDB4MTA0MywgMHgxYThmLCAiQVNVUyBVWDU4MlpTIiwg
QUxDMjQ1X0ZJWFVQX0NTMzVMNDFfU1BJXzIpLAogCVNORF9QQ0lfUVVJUksoMHgxMDQzLCAweDFi
MTEsICJBU1VTIFVYNDMxREEiLCBBTEMyOTRfRklYVVBfQVNVU19DT0VGXzFCKSwKIAlTTkRfUENJ
X1FVSVJLKDB4MTA0MywgMHgxYjEzLCAiQXN1cyBVNDFTViIsIEFMQzI2OV9GSVhVUF9JTlZfRE1J
QyksCgotLS0tLS0tLS0tLS0tLWFsc2EtaGRhLWNzMzVsNDEtYXN1cy11bTUzMDJsYS1maXgucGF0
Y2gtLQoKCg==
--0000000000001705ae0609b840b7--
