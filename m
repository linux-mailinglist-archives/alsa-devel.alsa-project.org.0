Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 394046FA18D
	for <lists+alsa-devel@lfdr.de>; Mon,  8 May 2023 09:52:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 91A8912FE;
	Mon,  8 May 2023 09:51:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 91A8912FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683532330;
	bh=WkhMR5D5tb01834+1eW9MD58gsfJiiwdpu1FEdTchEg=;
	h=From:Date:Subject:To:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=F/0w1xHF8jrbLy7hV826NMMPv8CQNvyOkH1MmjxHSQiVAsM5LKBr9lZXdL0Q/5jl6
	 mos0477hMiPui6YirKDCCjiHoyH+o4wYhs9hqNgYOFTKl3jNoTbnuEV3dFf8o+0lVS
	 FrmeYlWG5nbG4ys74BM01uTBTiAQyo5Twfjtnvt4=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 139BAF805F5;
	Mon,  8 May 2023 09:46:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8A760F8032D; Mon,  8 May 2023 05:02:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com
 [IPv6:2607:f8b0:4864:20::1132])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 46F82F802E8
	for <alsa-devel@alsa-project.org>; Mon,  8 May 2023 05:02:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 46F82F802E8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=JtkuanBe
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-55c939fb24dso35358677b3.2
        for <alsa-devel@alsa-project.org>;
 Sun, 07 May 2023 20:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683514922; x=1686106922;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=EM9Ubq1vKCbrmde66NfhmeEaWj16YcxY8NtZkiWkINs=;
        b=JtkuanBesqAGz3BWwpSZHk6hojBGzIiQkhaMnMkA4g8Jji1yzmjPoFYDBo1mdi+xUa
         7oRtt+dTFQRbQvhsMzUL+61t29sc7rajHZLljLspbmTPuzhW2KcwryZryPsJh2LsH3hZ
         tE2gIY2MMQ3nB/E1be/Vvl0wFzh46gePgKtH/HxTZvBju5RWM46HI3y1JqDLSpb/SDCz
         su+WrF6/1RyMtuHEj/DIIt9GGadbWwjga8bTK+X/fKMBzVX3JAaISZA/6/ZlGkBzWnKU
         FgExdM6yuFoFgGoA+cC9w1joFaLwT4N/Mr8XEZWQFOwfxyvdT+BgpNqE7HR8RrGRnnTA
         G4Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683514922; x=1686106922;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EM9Ubq1vKCbrmde66NfhmeEaWj16YcxY8NtZkiWkINs=;
        b=bmWVLO6oorAJ8AuLHbcR9Q2pbz/FCHSYQHkkzbve5vUOJUAOx9MCcCQlV6Vg+m9RoT
         uu8wYzWjO+zP7j8uiDPoeuDpuGFhl7psiSrcKgnFmF6jRUkjjx+kKvhvT27yOGkHtk2A
         YLqn355OPIe0Mwfh18WfeVcidnyAZ9gVpRK3SayGCK+OVeUbKWpQ+SCqHcJe4MCDzUuE
         buPvUZsLne7vLdGFfCBLbs78dINMVLdGsUrsmMBxmVD/PS5tJWzO0Ya1q7YRcePhkYgJ
         rZUZx/fwIOVZ0nruoZkAYbb0yveqjjwElou96RTJ/cKSrKxvMr9kXP3Yevc2T9y8BvRa
         FqZw==
X-Gm-Message-State: AC+VfDw47dP5v3kAqLpDwmo68uS16uzX9skwj8Qm/NnL+2EJrk/Dm4m4
	4ctFlbouTRJqflXb6j/QjsAdVc33eolwSy+5GMo=
X-Google-Smtp-Source: 
 ACHHUZ7tMZv8tYXxs3jC3Tst3y9RRf8/win4hiQoN723jII2e00W5Wb6k4bwvPg32x0pxbDMnSSjDceczxn3wSJSdyk=
X-Received: by 2002:a0d:ccc8:0:b0:55a:6efe:8e2f with SMTP id
 o191-20020a0dccc8000000b0055a6efe8e2fmr8903859ywd.45.1683514922494; Sun, 07
 May 2023 20:02:02 -0700 (PDT)
MIME-Version: 1.0
From: Dave Greengas <dave.greengas@gmail.com>
Date: Sun, 7 May 2023 22:01:51 -0500
Message-ID: 
 <CAOwgCp_h6w8mpMaXt9w7reTM+dDpvQ1WnhHQK=FHJLwVsn20aQ@mail.gmail.com>
Subject: Patch for HP Spectre x360 Convertible 14t-ea100 Sound
 (patch_realtek.c)
To: linux-kernel@vger.kernel.org
Content-Type: multipart/mixed; boundary="000000000000ee361005fb25dc1c"
X-MailFrom: dave.greengas@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: FU227N5ZIWVTLLNDI47VQJTY5GOQVZJ4
X-Message-ID-Hash: FU227N5ZIWVTLLNDI47VQJTY5GOQVZJ4
X-Mailman-Approved-At: Mon, 08 May 2023 07:46:29 +0000
X-Content-Filtered-By: Mailman/MimeDel 3.3.8
CC: Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FU227N5ZIWVTLLNDI47VQJTY5GOQVZJ4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

--000000000000ee361005fb25dc1c
Content-Type: text/plain; charset="UTF-8"

The sound for this laptop does not work without a patch to patch_realtek.c.
I noticed that it has an ALC245 sound card, but a different product id. I
have been running this patch for months and it works well. There is the
known issue with the top-mounted speakers, but this is the same as when I
manually run the hda-verbs as described on a forum post on kernel.org for
similar models.

I added the following line:
SND_PCI_QUIRK(0x103c, 0x89da, "HP Spectre x360 14",
ALC245_FIXUP_HP_X360_AMP),
Only the model 0x89da is different.
I ran the diff command against a 62 kernel, but noticed that 63 has the
same file and showed no commits.

I have been running this patch successfully for many months on the 62
branch, but I do not know anyone else with this same laptop model to
confirm that it works for them.

If there is a different process for submitting the patch, please let me
know.

Kernel 63 was just released for my distribution and I plan to test the
patch there as well, but I do not expect it to work differently.

---------------------------------
David Greengas

--000000000000ee361005fb25dc1c
Content-Type: text/x-patch; charset="US-ASCII";
 name="0999-patch_realtek.patch"
Content-Disposition: attachment; filename="0999-patch_realtek.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_lhe958w50>
X-Attachment-Id: f_lhe958w50

LS0tIC4uLy4uL2xpbnV4NjMvc3JjL2xpbnV4LTYuMy9zb3VuZC9wY2kvaGRhL3BhdGNoX3JlYWx0
ZWsuYwkyMDIzLTA0LTIzIDE0OjAyOjUyLjAwMDAwMDAwMCAtMDUwMAorKysgbGludXgtNi4yL3Nv
dW5kL3BjaS9oZGEvcGF0Y2hfcmVhbHRlay5jCTIwMjMtMDUtMDcgMTQ6Mjg6MDguOTc5NTI0NzA1
IC0wNTAwCkBAIC05NDA5LDYgKzk0MDksNyBAQAogCVNORF9QQ0lfUVVJUksoMHgxMDNjLCAweDg3
ZjUsICJIUCIsIEFMQzI4N19GSVhVUF9IUF9HUElPX0xFRCksCiAJU05EX1BDSV9RVUlSSygweDEw
M2MsIDB4ODdmNiwgIkhQIFNwZWN0cmUgeDM2MCAxNCIsIEFMQzI0NV9GSVhVUF9IUF9YMzYwX0FN
UCksCiAJU05EX1BDSV9RVUlSSygweDEwM2MsIDB4ODdmNywgIkhQIFNwZWN0cmUgeDM2MCAxNCIs
IEFMQzI0NV9GSVhVUF9IUF9YMzYwX0FNUCksCisJU05EX1BDSV9RVUlSSygweDEwM2MsIDB4ODlk
YSwgIkhQIFNwZWN0cmUgeDM2MCAxNCIsIEFMQzI0NV9GSVhVUF9IUF9YMzYwX0FNUCksCiAJU05E
X1BDSV9RVUlSSygweDEwM2MsIDB4ODgwNSwgIkhQIFByb0Jvb2sgNjUwIEc4IE5vdGVib29rIFBD
IiwgQUxDMjM2X0ZJWFVQX0hQX0dQSU9fTEVEKSwKIAlTTkRfUENJX1FVSVJLKDB4MTAzYywgMHg4
ODBkLCAiSFAgRWxpdGVCb29rIDgzMCBHOCBOb3RlYm9vayBQQyIsIEFMQzI4NV9GSVhVUF9IUF9H
UElPX0xFRCksCiAJU05EX1BDSV9RVUlSSygweDEwM2MsIDB4ODgxMSwgIkhQIFNwZWN0cmUgeDM2
MCAxNS1lYjF4eHgiLCBBTEMyODVfRklYVVBfSFBfU1BFQ1RSRV9YMzYwX0VCMSksCg==
--000000000000ee361005fb25dc1c--
