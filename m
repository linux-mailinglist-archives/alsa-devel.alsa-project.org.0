Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CBA17E71B4
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Nov 2023 19:50:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7F1FC4E;
	Thu,  9 Nov 2023 19:49:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7F1FC4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699555802;
	bh=mM0T96SwN8/D//UPA/dentG25xjYB6baVYfl9VICYtY=;
	h=From:Date:Subject:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Me6bKV5yIH2ErvrGJIron3GvGn2VUPwvtm597JabdN9TFNicHR0H1FVjL0BK4VN9M
	 Qf675daMuSo1YN6Hnsy1vOpzeFM+8cMRDM6yxUybrHWt1e3BAGVpu01i5NKcXcko+Z
	 kHJ5Nj+5Y9gU3mR+qiIiliLZbbJIewALyElUrh78=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 00E54F80578; Thu,  9 Nov 2023 19:48:25 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 357B5F80558;
	Thu,  9 Nov 2023 19:48:25 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2E821F80169; Thu,  9 Nov 2023 15:37:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 96F08F80152
	for <alsa-devel@alsa-project.org>; Thu,  9 Nov 2023 15:37:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 96F08F80152
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=TfNcPkNr
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-53d8320f0easo1444222a12.3
        for <alsa-devel@alsa-project.org>;
 Thu, 09 Nov 2023 06:37:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699540628; x=1700145428;
 darn=alsa-project.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vrg2ES1PmI3IKoG/O0Bj3+dLZEbYy0uZpb2wcc3HMXA=;
        b=TfNcPkNr8MtkXuq974mMn+zpOEDWo/nD5sIwW3XPfhy2QOo2sD26HOto8pl0SWIDQ6
         ye973O5VzPhP/ze9aJvsmjc1JXmc7E827x/gKrRnrWrlYNKzvMC99ZJ9QbRpE8zpNQT+
         u9hgRLGi7r12XEiDewYSS4zhFlgTaymNnocYumfNCWT0nF2LvHcei5J251T9pX8DqiEj
         McW6+9XH1eDfG2SxRXZgZV78SXezGXgwrT/QK5ufjsXYA7VDYZPohBnFxcFMXLt7bM5M
         2DXv40/V3QyRNecbYqFXAJt1k1/7j4ScrnKoVqFJ61vz2/UFg6NCAUSl7yx5BE1UihtZ
         s39Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699540628; x=1700145428;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vrg2ES1PmI3IKoG/O0Bj3+dLZEbYy0uZpb2wcc3HMXA=;
        b=ngaOtaRnjvL4nEAmoY3qALNRvqzHhGmgaSc1Eth3yPjiDBsJKnwFfmcNkE0ZXNkSwt
         N0vkNeupn7FQcnrH5IOVX6mgPoJZVkSNgAOYl7YQTidAGf7xVW3d6HEeDTU8QhImPeSI
         W9TLmOzya9epWbK77htKt8L4uM40jZ6lYNHuQrbW+TRrGP9lqstfAwxb5rVAeTnxlTCy
         thTAdjLwtja+W5Zn494edhBxNTg/AJmmoerbgjxE1uWUW4Tpz8G/TmclulH1ruKOzxkj
         gqrBFxH20UQFmgYSsZPJRO9Ho6NWLw/U2GrnvTlVfx5ruTcYsekpzlhOCrOMkdAMIyYY
         akvw==
X-Gm-Message-State: AOJu0YyLBs+cM4G9AizxQsrt58wW/801P9JDyMzcoTLgboumrAHyHTTl
	wm9llOS1JHl8FqDXvDyGMCNXz7c0NFwxH/JH7w==
X-Google-Smtp-Source: 
 AGHT+IFUgkBiEnFe6Fy0WMZ11SUz8PZ7KuidCfKNU3mGU0dccQ1kG6X8d3ttUjys9zQfWprIiuuN/8A6aQO92Y2XpFY=
X-Received: by 2002:a17:907:a183:b0:9dd:f5ba:856d with SMTP id
 om3-20020a170907a18300b009ddf5ba856dmr3244335ejc.62.1699540627720; Thu, 09
 Nov 2023 06:37:07 -0800 (PST)
MIME-Version: 1.0
From: "vitaly.torshyn@gmail.com" <vitaly.torshyn@gmail.com>
Date: Thu, 9 Nov 2023 16:36:55 +0200
Message-ID: 
 <CAHiQ-bCMPpCJ8eOYAaVVoqGkFixS1qTgSS4xfbZvL4oZV9LYew@mail.gmail.com>
Subject: [PATCH 1/1] [Patch v2] ALSA: HDA: Asus UM5302LA: Added quirks for
 cs35L41/10431A83 on i2c bus
To: Takashi Iwai <tiwai@suse.de>
Cc: perex@perex.cz, alsa-devel@alsa-project.org
Content-Type: multipart/mixed; boundary="00000000000065a72d0609b923ca"
X-MailFrom: vitaly.torshyn@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 562VP4M6KAEXZJ34ICRDOLXFPWLOZ4LK
X-Message-ID-Hash: 562VP4M6KAEXZJ34ICRDOLXFPWLOZ4LK
X-Mailman-Approved-At: Thu, 09 Nov 2023 18:48:21 +0000
X-Content-Filtered-By: Mailman/MimeDel 3.3.8
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/562VP4M6KAEXZJ34ICRDOLXFPWLOZ4LK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

--00000000000065a72d0609b923ca
Content-Type: text/plain; charset="UTF-8"

Hi Takashi,

Proposed second revision of the patch that fixes the initialization of
CSC3551 on the UM5302LA laptop.
Patching the DSDT table is not required since ASUS did add _DSD entry.
Nothing new introduced but reused work started by Stefan B.

Currently there is no official firmware available for 10431A83 on cirrus
git unfortunately.
For testing used 104317f3 (which is also seems on i2c bus):

$ cd /lib/firmware/cirrus/ && \
for fw in $(find ./ -name '*104317f3*'); do newfw=$(echo $fw | sed
's/104317f3/10431a83/g'); echo echo "$fw -> $newfw"; ln -s $f $newfw; done

With the patch applied to 6.6.0 and obviously symlinks to 104317F3 FW,
speakers work and to my surprise they sound quite good and loud without
distortion.

Probably confirmation from the cirrus team is needed on firmware.

Signed-off-by: Vitalii Torshyn <vitaly.torshyn@gmail.com>
---
diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 58006c8bc..a28d078c9 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -7444,6 +7444,7 @@ enum {
<----->ALC287_FIXUP_THINKPAD_I2S_SPK,
<----->ALC287_FIXUP_MG_RTKC_CSAMP_CS35L41_I2C_THINKPAD,
<----->ALC2XX_FIXUP_HEADSET_MIC,
+<----->ALC294_FIXUP_CS35L41_I2C_2
};
.
/* A special fixup for Lenovo C940 and Yoga Duet 7;
@@ -9552,6 +9553,11 @@ static const struct hda_fixup alc269_fixups[] = {
<-----><------>.type = HDA_FIXUP_FUNC,
<-----><------>.v.func = alc_fixup_headset_mic,
<----->},
+<----->[ALC294_FIXUP_CS35L41_I2C_2] = {
+<-----><------>.type = HDA_FIXUP_FUNC,
+<-----><------>.v.func = cs35l41_fixup_i2c_two,
+<----->},
+
};
.
static const struct snd_pci_quirk alc269_fixup_tbl[] = {
@@ -9913,6 +9919,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[]
= {
<----->SND_PCI_QUIRK(0x1043, 0x19e1, "ASUS UX581LV",
ALC295_FIXUP_ASUS_MIC_NO_PRESENCE),
<----->SND_PCI_QUIRK(0x1043, 0x1a13, "Asus G73Jw", ALC269_FIXUP_ASUS_G73JW),
<----->SND_PCI_QUIRK(0x1043, 0x1a30, "ASUS X705UD", ALC256_FIXUP_ASUS_MIC),
+<----->SND_PCI_QUIRK(0x1043, 0x1a83, "ASUS UM5302LA",
ALC294_FIXUP_CS35L41_I2C_2),
<----->SND_PCI_QUIRK(0x1043, 0x1a8f, "ASUS UX582ZS",
ALC245_FIXUP_CS35L41_SPI_2),
<----->SND_PCI_QUIRK(0x1043, 0x1b11, "ASUS UX431DA",
ALC294_FIXUP_ASUS_COEF_1B),
<----->SND_PCI_QUIRK(0x1043, 0x1b13, "Asus U41SV", ALC269_FIXUP_INV_DMIC),

--00000000000065a72d0609b923ca
Content-Type: text/x-patch; charset="US-ASCII";
	name="0002-Subject-PATCH-ALSA-HDA-Asus-UM5302LA-Added-quirks-fo.patch"
Content-Disposition: attachment;
	filename="0002-Subject-PATCH-ALSA-HDA-Asus-UM5302LA-Added-quirks-fo.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_loral30a0>
X-Attachment-Id: f_loral30a0

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
--00000000000065a72d0609b923ca--
