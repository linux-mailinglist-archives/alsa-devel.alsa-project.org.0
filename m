Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B14F7E6A67
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Nov 2023 13:17:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D5E7F844;
	Thu,  9 Nov 2023 13:17:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D5E7F844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699532271;
	bh=uTD8VeE30Xvlabjd7KSSVPTJsfisy4xpIa7Fw1BOgdM=;
	h=From:Date:Subject:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=qqN8wBlE7jzB4JzrEq4OSXNWgOYxhtkf/peWkDe+sGqmzCOdWnVxz0656DSEMbTyq
	 UbMQ6qlG3NXE1PeP2YhbZOmD5z7xYtncVEIQsi/UavmUt+gO3sbUxSKp1qK/sYRVFB
	 d1VHYirAYc6G6baF3VOs96eET5+f6xyUBAVGEQLU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 976CBF80169; Thu,  9 Nov 2023 13:16:52 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 48DAAF800ED;
	Thu,  9 Nov 2023 13:16:52 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1F0B1F8016D; Thu,  9 Nov 2023 01:23:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 527E1F80125
	for <alsa-devel@alsa-project.org>; Thu,  9 Nov 2023 01:23:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 527E1F80125
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=I7c2T5Bw
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-9dd3f4a0f5aso50223966b.1
        for <alsa-devel@alsa-project.org>;
 Wed, 08 Nov 2023 16:23:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699489389; x=1700094189;
 darn=alsa-project.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qQ5OblFLCHUEhBZNXb4MuX1zkLNAE+gNXXxbwajZSUM=;
        b=I7c2T5Bw0ubqdDKHHANsSc7QBxeCWwnbdQNc2YRbWOxJ55GjgI+tIAsViK4a3vNJMX
         hri3q1iMQTvqFnzN/1hi2zIx/6OcZWXH++ug1fkZ1Y3OjzFtCCrKr2R13UPG3ESKJctS
         XJ8K7gYV1exTuSkwHSgrjj/RRufXowyHY30J59kMYXx8BLVAXv8stIioCQ+I+vhw1R54
         3+IgfE7wfPpsiPihEGRjJFVR+Rom5xyANGkC663kIo5QoEDrWGqmz6irh2ansdCoyHmP
         XqRKDJJYds4IeFSKlC2RcbZLtLAEmNEQul55l/thF3utCawi/gBEZYWmtyQrV6G4hcEN
         bVbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699489389; x=1700094189;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qQ5OblFLCHUEhBZNXb4MuX1zkLNAE+gNXXxbwajZSUM=;
        b=Feb3vN7Ry8cXxYjcIyeJKacznGL16SCBIeGAsQ8syhOlCMZahk0/zhTlhxlgPwKse2
         Jht7fMVvbLDK+HOWNthkdJuIC5T13pus3I8P0tRhdM/pNGK+CKOJeE1ogGdowbPrtZc9
         zWbTAVAClJadrFAsFS1XOmlmhuZTEFIurBoM3UA20KaZWlOjKGoAMIFKCkkgY+QKzAgc
         bGohLJAjehO19nesaE5+R4oTieEC/1wOHdTy/9kGEcR6op5fvTzvhi2Y9GaxxCY5O7gy
         y9BeKT3VKASvwxLRsh5KaRlWpRrzAOZfSOAxYeWegT/usTeMiI6J2jFAXdSs+HR/WJJN
         FIEA==
X-Gm-Message-State: AOJu0YzFsueuHEzmNEsP7Lzxb808f/morDt7e29bvPqPSMRIUMO3cUGs
	EDnxxpsmNFPujlCVw0D2kLtz5FezCtqW8EU5wg==
X-Google-Smtp-Source: 
 AGHT+IEra6bOPI7RG1P5O4kUpDXuXISFAgwDA1lJ6bwWYzN4dmekuOmG/USduZpBSY+q+DC0bUULCpDrFuvCak/4p2U=
X-Received: by 2002:a17:907:6088:b0:9dd:79ce:fc72 with SMTP id
 ht8-20020a170907608800b009dd79cefc72mr2950859ejc.71.1699489388892; Wed, 08
 Nov 2023 16:23:08 -0800 (PST)
MIME-Version: 1.0
From: "vitaly.torshyn@gmail.com" <vitaly.torshyn@gmail.com>
Date: Thu, 9 Nov 2023 02:22:57 +0200
Message-ID: 
 <CAHiQ-bDGx89vWjtqrnH4FtO-JF9XUWMgwCpR4nusC9Zvw=bN7Q@mail.gmail.com>
Subject: [PATCH 1/1] ALSA: HDA: Asus UM5302LA: Added quirks for
 cs35L41/10431A83 on i2c bus
To: tiwai@suse.de
Cc: perex@perex.cz, alsa-devel@alsa-project.org
Content-Type: multipart/mixed; boundary="0000000000005332170609ad3562"
X-MailFrom: vitaly.torshyn@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: TO4GSF22VKV2RAWZDTNWTALOWSHKE5IO
X-Message-ID-Hash: TO4GSF22VKV2RAWZDTNWTALOWSHKE5IO
X-Mailman-Approved-At: Thu, 09 Nov 2023 12:16:49 +0000
X-Content-Filtered-By: Mailman/MimeDel 3.3.8
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TO4GSF22VKV2RAWZDTNWTALOWSHKE5IO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

--0000000000005332170609ad3562
Content-Type: text/plain; charset="UTF-8"

Hi Takashi,

Proposed patch fixes initialization of CSC3551 on the UM5302LA laptop.
Patching DSDT table is not required since ASUS did added _DSD entry.
Nothing new introduced but reused work started by Stefan B.

Currently there is no official firmware available for 10431A83 on cirrus
git unfortunately.
For testing used 104317f3 (which is also seems on i2c bus):

$ cd /lib/firmware/cirrus/ && \
for fw in $(find ./ -name '*104317f3*'); do newfw=$(echo $fw | sed
's/104317f3/10431a83/g'); echo echo "$fw -> $newfw"; ln -s $f $newfw; done

With the patch applied to 6.6.0 and obviously symlinks to 104317F3 FW,
speakers works and to my susrprise they sound quite good and loud without
distortion.

Probably confirmation from cirrus team is needed on firmware.

Signed-off-by: Vitalii Torshyn <vitaly.torshyn@gmail.com>
---
sound/pci/hda/patch_realtek.c | 7 +++++++
1 file changed, 7 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 58006c8bc..52956b58a 100644
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
@@ -9937,6 +9943,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[]
= {
       SND_PCI_QUIRK(0x1043, 0x1c52, "ASUS Zephyrus G15 2022",
ALC289_FIXUP_ASUS_GA401),
       SND_PCI_QUIRK(0x1043, 0x1f11, "ASUS Zephyrus G14",
ALC289_FIXUP_ASUS_GA401),
       SND_PCI_QUIRK(0x1043, 0x1f12, "ASUS UM5302",
ALC287_FIXUP_CS35L41_I2C_2),
+       SND_PCI_QUIRK(0x1043, 0x1a83, "ASUS UM5302LA",
ALC294_FIXUP_CS35L41_I2C_2),
       SND_PCI_QUIRK(0x1043, 0x1f92, "ASUS ROG Flow X16",
ALC289_FIXUP_ASUS_GA401),
       SND_PCI_QUIRK(0x1043, 0x3030, "ASUS ZN270IE",
ALC256_FIXUP_ASUS_AIO_GPIO2),
       SND_PCI_QUIRK(0x1043, 0x3a20, "ASUS G614JZR",
ALC245_FIXUP_CS35L41_SPI_2),

--0000000000005332170609ad3562
Content-Type: text/x-patch; charset="US-ASCII";
	name="0001-Subject-PATCH-ALSA-HDA-Asus-UM5302LA-Added-quirks-fo.patch"
Content-Disposition: attachment;
	filename="0001-Subject-PATCH-ALSA-HDA-Asus-UM5302LA-Added-quirks-fo.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_loqg3d130>
X-Attachment-Id: f_loqg3d130

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
dGVrLmMKaW5kZXggNTgwMDZjOGJjLi41Mjk1NmI1OGEgMTAwNjQ0Ci0tLSBhL3NvdW5kL3BjaS9o
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
IGFsYzI2OV9maXh1cF90YmxbXSA9IHsKQEAgLTk5MzcsNiArOTk0Myw3IEBAIHN0YXRpYyBjb25z
dCBzdHJ1Y3Qgc25kX3BjaV9xdWlyayBhbGMyNjlfZml4dXBfdGJsW10gPSB7CiAJU05EX1BDSV9R
VUlSSygweDEwNDMsIDB4MWM1MiwgIkFTVVMgWmVwaHlydXMgRzE1IDIwMjIiLCBBTEMyODlfRklY
VVBfQVNVU19HQTQwMSksCiAJU05EX1BDSV9RVUlSSygweDEwNDMsIDB4MWYxMSwgIkFTVVMgWmVw
aHlydXMgRzE0IiwgQUxDMjg5X0ZJWFVQX0FTVVNfR0E0MDEpLAogCVNORF9QQ0lfUVVJUksoMHgx
MDQzLCAweDFmMTIsICJBU1VTIFVNNTMwMiIsIEFMQzI4N19GSVhVUF9DUzM1TDQxX0kyQ18yKSwK
KwlTTkRfUENJX1FVSVJLKDB4MTA0MywgMHgxYTgzLCAiQVNVUyBVTTUzMDJMQSIsIEFMQzI5NF9G
SVhVUF9DUzM1TDQxX0kyQ18yKSwKIAlTTkRfUENJX1FVSVJLKDB4MTA0MywgMHgxZjkyLCAiQVNV
UyBST0cgRmxvdyBYMTYiLCBBTEMyODlfRklYVVBfQVNVU19HQTQwMSksCiAJU05EX1BDSV9RVUlS
SygweDEwNDMsIDB4MzAzMCwgIkFTVVMgWk4yNzBJRSIsIEFMQzI1Nl9GSVhVUF9BU1VTX0FJT19H
UElPMiksCiAJU05EX1BDSV9RVUlSSygweDEwNDMsIDB4M2EyMCwgIkFTVVMgRzYxNEpaUiIsIEFM
QzI0NV9GSVhVUF9DUzM1TDQxX1NQSV8yKSwKCi0tLS0tLS0tLS0tLS0tYWxzYS1oZGEtY3MzNWw0
MS1hc3VzLXVtNTMwMmxhLWZpeC5wYXRjaC0tCgoK
--0000000000005332170609ad3562--
