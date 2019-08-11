Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C860894AB
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Aug 2019 00:21:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 09F74165D;
	Mon, 12 Aug 2019 00:20:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 09F74165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565562104;
	bh=SLKY+5ZLacO7guZ8oqpvgWMeqhvJPo/38+Dk2bWUZvE=;
	h=From:Date:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=i3HKxsRhY1v8KQUdLfDo6upI0dkjtRNJqE3F4toadkAaUmHammxcqSAcVuxZnGTZP
	 GwvTrL5RgqD+ISBkj4pr4Akv8X8KC2zSnDC7v0844E5zsKW/ME71qA4kTBjp89Mvnp
	 UYa/Zm3rmCLG7aXEfSrlwEMDU9hMRPQ1iXa9HMDg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3E58CF80273;
	Mon, 12 Aug 2019 00:20:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2CF8BF80273; Mon, 12 Aug 2019 00:19:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A172AF8015B
 for <alsa-devel@alsa-project.org>; Mon, 12 Aug 2019 00:19:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A172AF8015B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="QANDH1OA"
Received: by mail-lj1-x242.google.com with SMTP id l14so6734400lje.2
 for <alsa-devel@alsa-project.org>; Sun, 11 Aug 2019 15:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=mEx7mShT9GbJPBQeyGiDGMaSIRGfvcMa1t0hMVneidU=;
 b=QANDH1OA8GkUtFgYgvO4EJM17LJqjrT8gwK/A0paC88jGh5ZCpGFMx6nz8SPJtnbRA
 tleQshvQd06+Z8N4vFof+5E0PmxF97bSBuQ58952hmtqro0/y0tw9S7iOfv+SOkZdew+
 Soxn+/n9uyhZVdQ2WRHXjx6KFh/FyCQF/NuhDKfl58EszWBsUSiG4VPazrI4BkpV0fY1
 55YeLF+Xjd7AFECuGOHekaoK+cwhA6NqhUcFF96pnGDISpoANw8JvwCxc4EtR7KTYbOA
 cbcMEgQD2dqL4egjSlexyEBnrweC8SSSYu8wznjCVFjOQtMUchyOfon+836egQo62Rgy
 X4DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=mEx7mShT9GbJPBQeyGiDGMaSIRGfvcMa1t0hMVneidU=;
 b=pbCjPpNIBC0Jv34N6fc9FFUPRoFvf3zEiv3IBlSF+LmUP4RdA5cu1PIC52aTjzuREu
 3VJPN+sbHr5vOEz9RUu3U5Qlp6i+guiYlXxGQiQCsl49dRqo6LBKnJlDHS1ZeHhj9KTB
 wPl/xIAlh+3pF9LV4Ep+mkhG7VOMQPvayjd3yGYScDkTY02sRc5pJZ+qpkovPqTgqgjS
 QQptb7w4ZB3jpDWiyK4Uk8qGlryD7jIx/RbwN663fFHnkMGHC+c2S/vKiAUI4Gf1ZFSV
 UeY1xtZKCdmVm+nq4QzjraM5bCKNy0dI1MYNxlKFY/JfnUOsNFl7T3HuHcDw08WZqn9N
 NU3A==
X-Gm-Message-State: APjAAAWJwOOo1eKCFu0mxWeWdy3u1kOd2gQEVc5vr2SIa6pnidW/cKIt
 Nlwr/xZwgeTZlh3gzYTbwTAkVKTB2zNXahIw9F+FFrnzLI4=
X-Google-Smtp-Source: APXvYqxahAueJeivJCESizZtUJL3vciWKqAf8JDnm/U+l1jB3HxkFhyYgnIjwVrPzK1BtfpY3h3Cj5bQ0dasc3Yku4Q=
X-Received: by 2002:a2e:9a13:: with SMTP id o19mr17919179lji.102.1565561993781; 
 Sun, 11 Aug 2019 15:19:53 -0700 (PDT)
MIME-Version: 1.0
From: Dennis Mungai <dmngaie@gmail.com>
Date: Mon, 12 Aug 2019 01:19:17 +0300
Message-ID: <CAKKYfmGOWD2w2Ozr8vwLTYpjdJ4bTegxWqPjhzyBtB5TVvqCzg@mail.gmail.com>
To: alsa-devel@alsa-project.org
Content-Type: multipart/mixed; boundary="000000000000838aa9058fdecea9"
Cc: Takashi Iwai <tiwai@suse.de>, jackpot51@gmail.com
Subject: [alsa-devel] [PATCH] Add support for Sabre HiFi on System76 and
	Clevo laptops
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

--000000000000838aa9058fdecea9
Content-Type: text/plain; charset="UTF-8"

Hello there,

The patch attached below is based on Jeremy Soller's prior work on:
https://patchwork.kernel.org/patch/9552671/ , copied herein.

Cleaned up to pass checkpatch.pl tests.

I can confirm that this patch does indeed fix the audio DAC init on
the Clevo based P775TM1-R chassis with no issues.

Warm regards,

Dennis Mungai

--000000000000838aa9058fdecea9
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-Fix-ESS-Sabre-DAC-init-for-Clevo-laptops.patch"
Content-Disposition: attachment; 
	filename="0001-Fix-ESS-Sabre-DAC-init-for-Clevo-laptops.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_jz7j42c70>
X-Attachment-Id: f_jz7j42c70

RnJvbSA5ZjZiN2Y1MWE4YmU3MzhiYjU4OGU4ZDZiMGY0ZDlmYjhhYzVhMGNlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBicmFpbmlhcmM3IDxkbW5nYWllQGdtYWlsLmNvbT4KRGF0ZTog
TW9uLCAxMiBBdWcgMjAxOSAwMDo0Mzo1NSArMDMwMApTdWJqZWN0OiBbUEFUQ0ggMS8xXSBGaXgg
RVNTIFNhYnJlIERBQyBpbml0IGZvciBDbGV2byBsYXB0b3BzCgpTaWduZWQtb2ZmLWJ5OiBicmFp
bmlhcmM3IDxkbW5nYWllQGdtYWlsLmNvbT4KLS0tCiBzb3VuZC9wY2kvaGRhL3BhdGNoX3JlYWx0
ZWsuYyB8IDU0ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystCiAxIGZpbGUgY2hh
bmdlZCwgNTMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3NvdW5k
L3BjaS9oZGEvcGF0Y2hfcmVhbHRlay5jIGIvc291bmQvcGNpL2hkYS9wYXRjaF9yZWFsdGVrLmMK
aW5kZXggZGUyMjRjYmVhLi5kOGY5ODYyY2IgMTAwNjQ0Ci0tLSBhL3NvdW5kL3BjaS9oZGEvcGF0
Y2hfcmVhbHRlay5jCisrKyBiL3NvdW5kL3BjaS9oZGEvcGF0Y2hfcmVhbHRlay5jCkBAIC0xODk5
LDYgKzE4OTksNyBAQCBlbnVtIHsKICAgIEFMQzg4Ml9GSVhVUF9OT19QUklNQVJZX0hQLAogICAg
QUxDODg3X0ZJWFVQX0FTVVNfQkFTUywKICAgIEFMQzg4N19GSVhVUF9CQVNTX0NITUFQLAorICAg
QUxDODk4X0ZJWFVQX0NMRVZPX1NQRElGLAogICAgQUxDMTIyMF9GSVhVUF9HQl9EVUFMX0NPREVD
UywKICAgIEFMQzEyMjBfRklYVVBfQ0xFVk9fUDk1MCwKICAgIEFMQzEyMjBfRklYVVBfQ0xFVk9f
UEI1MUVELApAQCAtMjAyOSw2ICsyMDMwLDQzIEBAIHN0YXRpYyB2b2lkIGFsYzg4Ml9maXh1cF9u
b19wcmltYXJ5X2hwKHN0cnVjdCBoZGFfY29kZWMgKmNvZGVjLAogICAgfQogfQogCitzdGF0aWMg
dm9pZCBhbGM4OThfY2xldm9fZGFjX2hvb2soc3RydWN0IGhkYV9jb2RlYyAqY29kZWMsCisJCQkJ
ICAgc3RydWN0IGhkYV9qYWNrX2NhbGxiYWNrICpqYWNrKQoreworICAgICAgIGludCB2YWw7CisK
KyAgICAgICAvLyBSZWFkIEVTUyBEQUMgc3RhdHVzCisgICAgICAgc25kX2hkYV9jb2RlY193cml0
ZShjb2RlYywgY29kZWMtPmNvcmUuYWZnLCAwLCBBQ19WRVJCX1NFVF9HUElPX01BU0ssIDQpOwor
ICAgICAgIHNuZF9oZGFfY29kZWNfd3JpdGUoY29kZWMsIGNvZGVjLT5jb3JlLmFmZywgMCwgQUNf
VkVSQl9TRVRfR1BJT19ESVJFQ1RJT04sIDApOworICAgICAgIHZhbCA9IHNuZF9oZGFfY29kZWNf
cmVhZChjb2RlYywgY29kZWMtPmNvcmUuYWZnLCAwLCBBQ19WRVJCX0dFVF9HUElPX0RBVEEsIDAp
OworICAgICAgIHZhbCAmPSAweDA0OworCisgICAgICAgaWYgKHZhbCA9PSAwKSB7CisJICAgICAg
IC8vIFNldCBWUkVGIG9uIGhlYWRwaG9uZSBwaW4gdG8gODAlCisJICAgICAgIHZhbCA9IHNuZF9o
ZGFfY29kZWNfZ2V0X3Bpbl90YXJnZXQoY29kZWMsIDB4MWIpOworCSAgICAgICB2YWwgfD0gQUNf
UElOQ1RMX1ZSRUZfODA7CisJICAgICAgIHNuZF9oZGFfc2V0X3Bpbl9jdGwoY29kZWMsIDB4MWIs
IHZhbCk7CisgICAgICAgfSBlbHNlIHsKKwkgICAgICAgLy8gU2V0IFZSRUYgb24gaGVhZHBob25l
IHBpbiB0byBISVoKKwkgICAgICAgdmFsID0gc25kX2hkYV9jb2RlY19nZXRfcGluX3RhcmdldChj
b2RlYywgMHgxYik7CisJICAgICAgIHZhbCA9IHZhbCAmIDB4ZmZmODsKKwkgICAgICAgc25kX2hk
YV9zZXRfcGluX2N0bChjb2RlYywgMHgxYiwgdmFsKTsKKyAgICAgICB9Cit9CisKK3N0YXRpYyB2
b2lkIGFsYzg5OF9maXh1cF9jbGV2byhzdHJ1Y3QgaGRhX2NvZGVjICpjb2RlYywKKwkJCQkgICAg
ICBjb25zdCBzdHJ1Y3QgaGRhX2ZpeHVwICpmaXgsIGludCBhY3Rpb24pCit7CisgICAgICAgc3dp
dGNoIChhY3Rpb24pIHsKKyAgICAgICBjYXNlIEhEQV9GSVhVUF9BQ1RfUFJFX1BST0JFOgorCSAg
ICAgICBzbmRfaGRhX2phY2tfZGV0ZWN0X2VuYWJsZV9jYWxsYmFjayhjb2RlYywgMHgxYiwgYWxj
ODk4X2NsZXZvX2RhY19ob29rKTsKKwkgICAgICAgYnJlYWs7CisgICAgICAgY2FzZSBIREFfRklY
VVBfQUNUX0lOSVQ6CisJICAgICAgIHNuZF9oZGFfY29kZWNfcmVhZChjb2RlYywgMHgxYiwgMCwg
QUNfVkVSQl9TRVRfUElOX1dJREdFVF9DT05UUk9MLCA0KTsKKwkgICAgICAgYnJlYWs7CisgICAg
ICAgfQorfQorCiBzdGF0aWMgdm9pZCBhbGNfZml4dXBfYmFzc19jaG1hcChzdHJ1Y3QgaGRhX2Nv
ZGVjICpjb2RlYywKICAgICAgICAgICAgICAgICBjb25zdCBzdHJ1Y3QgaGRhX2ZpeHVwICpmaXgs
IGludCBhY3Rpb24pOwogCkBAIC0yMzUwLDcgKzIzODgsMTEgQEAgc3RhdGljIGNvbnN0IHN0cnVj
dCBoZGFfZml4dXAgYWxjODgyX2ZpeHVwc1tdID0gewogICAgW0FMQzg4N19GSVhVUF9CQVNTX0NI
TUFQXSA9IHsKICAgICAgICAudHlwZSA9IEhEQV9GSVhVUF9GVU5DLAogICAgICAgIC52LmZ1bmMg
PSBhbGNfZml4dXBfYmFzc19jaG1hcCwKLSAgIH0sCisgICAgfSwgW0FMQzg5OF9GSVhVUF9DTEVW
T19TUERJRl0gPSB7CisJCS50eXBlID0gSERBX0ZJWFVQX0ZVTkMsCisJCS52LmZ1bmMgPSBhbGM4
OThfZml4dXBfY2xldm8sCisJfSwKKwogICAgW0FMQzEyMjBfRklYVVBfR0JfRFVBTF9DT0RFQ1Nd
ID0gewogICAgICAgIC50eXBlID0gSERBX0ZJWFVQX0ZVTkMsCiAgICAgICAgLnYuZnVuYyA9IGFs
YzEyMjBfZml4dXBfZ2JfZHVhbF9jb2RlY3MsCkBAIC0yNDU5LDYgKzI1MDEsMTEgQEAgc3RhdGlj
IGNvbnN0IHN0cnVjdCBzbmRfcGNpX3F1aXJrIGFsYzg4Ml9maXh1cF90YmxbXSA9IHsKICAgIHt9
CiB9OwogCitzdGF0aWMgY29uc3Qgc3RydWN0IHNuZF9wY2lfcXVpcmsgYWxjODk4X2ZpeHVwX3Ri
bFtdID0geworICAgIFNORF9QQ0lfUVVJUktfVkVORE9SKDB4MTU1OCwgIkNsZXZvIGxhcHRvcCIs
IEFMQzg5OF9GSVhVUF9DTEVWT19TUERJRiksCisgICAge30KK307CisKIHN0YXRpYyBjb25zdCBz
dHJ1Y3QgaGRhX21vZGVsX2ZpeHVwIGFsYzg4Ml9maXh1cF9tb2RlbHNbXSA9IHsKICAgIHsuaWQg
PSBBTEM4ODJfRklYVVBfQUJJVF9BVzlEX01BWCwgLm5hbWUgPSAiYWJpdC1hdzlkIn0sCiAgICB7
LmlkID0gQUxDODgyX0ZJWFVQX0xFTk9WT19ZNTMwLCAubmFtZSA9ICJsZW5vdm8teTUzMCJ9LApA
QCAtMjUyNCw2ICsyNTcxLDExIEBAIHN0YXRpYyBpbnQgcGF0Y2hfYWxjODgyKHN0cnVjdCBoZGFf
Y29kZWMgKmNvZGVjKQogICAgY2FzZSAweDEwZWMwOTAwOgogICAgY2FzZSAweDEwZWMxMjIwOgog
ICAgICAgIGJyZWFrOworCSBjYXNlIDB4MTBlYzA4OTg6CisJIGNhc2UgMHgxMGVjMDg5OToKKwkJ
IHNuZF9oZGFfcGlja19maXh1cChjb2RlYywgTlVMTCwgYWxjODk4X2ZpeHVwX3RibCwKKwkJCWFs
Yzg4Ml9maXh1cHMpOworCQlicmVhazsKICAgIGRlZmF1bHQ6CiAgICAgICAgLyogQUxDODgzIGFu
ZCB2YXJpYW50cyAqLwogICAgICAgIGFsY19maXhfcGxsX2luaXQoY29kZWMsIDB4MjAsIDB4MGEs
IDEwKTsKLS0gCjIuMTcuMQoK
--000000000000838aa9058fdecea9
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--000000000000838aa9058fdecea9--
