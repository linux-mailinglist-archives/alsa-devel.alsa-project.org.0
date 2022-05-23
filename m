Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 30BCC5315F1
	for <lists+alsa-devel@lfdr.de>; Mon, 23 May 2022 22:21:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B03DC1724;
	Mon, 23 May 2022 22:20:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B03DC1724
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653337295;
	bh=qqdB5XyceMBmLezXwtyOqUE8qZ+J16/esNriv1Ztjq0=;
	h=Date:From:Subject:To:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Sg2lpq/xwFS1ghHtD3ub5nrRx+u6gwxBzlPybc4I5jl142knBPx41APDsdaSOt2g7
	 OvD1ip/AphFPmKIIZYDac50TAEit7nbMV1DhZGRPHXChlDRWM6DtLIq8zYPU5taPLy
	 XX1w19k8+VX1rpXg/74d4n3UQ8Kx9WbizE7qXnwE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F3CF4F8025E;
	Mon, 23 May 2022 22:20:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E0683F80236; Mon, 23 May 2022 22:20:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=KHOP_HELO_FCRDNS, PRX_BODY_32, 
 SPF_HELO_NONE, SPF_NONE, T_SCC_BODY_TEXT_LINE, UNPARSEABLE_RELAY,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from relay5.hostedemail.com (smtprelay0010.hostedemail.com
 [216.40.44.10])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0BA1CF800CB
 for <alsa-devel@alsa-project.org>; Mon, 23 May 2022 22:20:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0BA1CF800CB
Received: from omf19.hostedemail.com (a10.router.float.18 [10.200.18.1])
 by unirelay06.hostedemail.com (Postfix) with ESMTP id 3885835065
 for <alsa-devel@alsa-project.org>; Mon, 23 May 2022 20:20:25 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: dag@bakke.com) by
 omf19.hostedemail.com (Postfix) with ESMTPA id 96C9020028
 for <alsa-devel@alsa-project.org>; Mon, 23 May 2022 20:20:19 +0000 (UTC)
Content-Type: multipart/mixed; boundary="------------38fIC0kcIjW30x7NSyUddUFr"
Message-ID: <5d5924ee-a52a-04f0-5080-2b8d91bce5ba@bakke.com>
Date: Mon, 23 May 2022 22:20:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
From: Dag B <dag@bakke.com>
Subject: [PATCH] Enable SPDIF output on Intel Hades Canyon
To: ALSA development <alsa-devel@alsa-project.org>
X-Stat-Signature: u15tuf7wk11au4ux1zz196pfzicjw3ga
X-Rspamd-Server: rspamout03
X-Rspamd-Queue-Id: 96C9020028
X-Session-Marker: 6461674062616B6B652E636F6D
X-Session-ID: U2FsdGVkX1/hvDshtNWQ6KDQkOnoHOAXzwL0lwfu2tU=
X-HE-Tag: 1653337219-983810
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

This is a multi-part message in MIME format.
--------------38fIC0kcIjW30x7NSyUddUFr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Without the attached patch, the s/pdif output on the Hades Canyon NUC 
does not work.

"Well known" issue, less known fix. As far as I can tell, there is no 
risk of any averse side-effects. But a bonus fix is enabling on-wire 
headset microphone, by chaining the right 'model' choice for the hardware.

If I should Cc: someone directly for this patch to be picked up, please 
let me know.


I have been running with this patch for half a year or so.

Patch passes checkpatch.pl

Patch is based on what 'cyber4o' posted on the insanelymac forum [1]. 
All the glory to this person, any error is likely mine.

Some other users with issues: [2] [3]


Dag Bakke


[1] 
https://www.insanelymac.com/forum/topic/339291-guide-hac-mini-osx-mojave-on-intel-hades-canyon-nuc8i7hvknuc8i7hnk/page/8/

2] https://bbs.archlinux.org/viewtopic.php?id=270917

[3] 
https://www.reddit.com/r/intelnuc/comments/9ft9x8/any_linux_users_got_the_spdif_toslink_to_work_on/



--------------38fIC0kcIjW30x7NSyUddUFr
Content-Type: text/x-patch; charset=UTF-8; name="patch_realtek.c.diff"
Content-Disposition: attachment; filename="patch_realtek.c.diff"
Content-Transfer-Encoding: base64

ZGlmZiAtLWdpdCBhL3NvdW5kL3BjaS9oZGEvcGF0Y2hfcmVhbHRlay5jIGIvc291bmQvcGNp
L2hkYS9wYXRjaF9yZWFsdGVrLmMKaW5kZXggYWQyOTJkZjdkODA1Li4xYzRjNzQzNWI3MDUg
MTAwNjQ0Ci0tLSBhL3NvdW5kL3BjaS9oZGEvcGF0Y2hfcmVhbHRlay5jCisrKyBiL3NvdW5k
L3BjaS9oZGEvcGF0Y2hfcmVhbHRlay5jCkBAIC00NzUyLDYgKzQ3NTIsMTIgQEAgc3RhdGlj
IHZvaWQgYWxjMjgwX2ZpeHVwX2hwX2dwaW8yX21pY19ob3RrZXkoc3RydWN0IGhkYV9jb2Rl
YyAqY29kZWMsCiAJfQogfQogCitzdGF0aWMgdm9pZCBhbGM3MDBfZml4dXBfbnVjX3NwZGlm
KHN0cnVjdCBoZGFfY29kZWMgKmNvZGVjLAorCQkJCWNvbnN0IHN0cnVjdCBoZGFfZml4dXAg
KmZpeCwgaW50IGFjdGlvbikKK3sKKwlzbmRfaGRhX292ZXJyaWRlX3djYXBzKGNvZGVjLCAw
eDYsIDB4NjExKTsKK30KKwogLyogTGluZTIgPSBtaWMgbXV0ZSBob3RrZXkKICAqIEdQSU8y
ID0gbWljIG11dGUgTEVECiAgKi8KQEAgLTU3OTIsNyArNTc5OCw3IEBAIHN0YXRpYyB2b2lk
IGFsY19maXh1cF9oZWFkc2V0X21vZGVfYWxjMjU1X25vX2hwX21pYyhzdHJ1Y3QgaGRhX2Nv
ZGVjICpjb2RlYywKIAkJc3RydWN0IGFsY19zcGVjICpzcGVjID0gY29kZWMtPnNwZWM7CiAJ
CXNwZWMtPnBhcnNlX2ZsYWdzIHw9IEhEQV9QSU5DRkdfSEVBRFNFVF9NSUM7CiAJCWFsYzI1
NV9zZXRfZGVmYXVsdF9qYWNrX3R5cGUoY29kZWMpOwotCX0gCisJfQogCWVsc2UKIAkJYWxj
X2ZpeHVwX2hlYWRzZXRfbW9kZShjb2RlYywgZml4LCBhY3Rpb24pOwogfQpAQCAtNjkzOSw2
ICs2OTQ1LDcgQEAgZW51bSB7CiAJQUxDMjI1X0ZJWFVQX0RFTExfV1lTRV9NSUNfTk9fUFJF
U0VOQ0UsCiAJQUxDMjI1X0ZJWFVQX1MzX1BPUF9OT0lTRSwKIAlBTEM3MDBfRklYVVBfSU5U
RUxfUkVGRVJFTkNFLAorCUFMQzcwMF9GSVhVUF9OVUNfU1BESUYsCiAJQUxDMjc0X0ZJWFVQ
X0RFTExfQklORF9EQUNTLAogCUFMQzI3NF9GSVhVUF9ERUxMX0FJT19MSU5FT1VUX1ZFUkIs
CiAJQUxDMjk4X0ZJWFVQX1RQVDQ3MF9ET0NLX0ZJWCwKQEAgLTcyNjAsNiArNzI2NywxMiBA
QCBzdGF0aWMgY29uc3Qgc3RydWN0IGhkYV9maXh1cCBhbGMyNjlfZml4dXBzW10gPSB7CiAJ
CS5jaGFpbmVkID0gdHJ1ZSwKIAkJLmNoYWluX2lkID0gQUxDMjY5X0ZJWFVQX1RISU5LUEFE
X0FDUEksCiAJfSwKKwlbQUxDNzAwX0ZJWFVQX05VQ19TUERJRl0gPSB7CisJCS50eXBlID0g
SERBX0ZJWFVQX0ZVTkMsCisJCS52LmZ1bmMgPSBhbGM3MDBfZml4dXBfbnVjX3NwZGlmLAor
CQkuY2hhaW5lZCA9IHRydWUsCisJCS5jaGFpbl9pZCA9IEFMQzI2OV9GSVhVUF9ERUxMMV9N
SUNfTk9fUFJFU0VOQ0UsCisJfSwKIAlbQUxDMjY5X0ZJWFVQX0RFTEwxX01JQ19OT19QUkVT
RU5DRV0gPSB7CiAJCS50eXBlID0gSERBX0ZJWFVQX1BJTlMsCiAJCS52LnBpbnMgPSAoY29u
c3Qgc3RydWN0IGhkYV9waW50YmxbXSkgewpAQCAtOTE1OSw2ICs5MTcyLDcgQEAgc3RhdGlj
IGNvbnN0IHN0cnVjdCBzbmRfcGNpX3F1aXJrIGFsYzI2OV9maXh1cF90YmxbXSA9IHsKIAlT
TkRfUENJX1FVSVJLKDB4MTBjZiwgMHgxNzU3LCAiTGlmZWJvb2sgRTc1MiIsIEFMQzI2OV9G
SVhVUF9MSUZFQk9PS19IUF9QSU4pLAogCVNORF9QQ0lfUVVJUksoMHgxMGNmLCAweDE4NDUs
ICJMaWZlYm9vayBVOTA0IiwgQUxDMjY5X0ZJWFVQX0xJRkVCT09LX0VYVE1JQyksCiAJU05E
X1BDSV9RVUlSSygweDEwZWMsIDB4MTBmMiwgIkludGVsIFJlZmVyZW5jZSBib2FyZCIsIEFM
QzcwMF9GSVhVUF9JTlRFTF9SRUZFUkVOQ0UpLAorCVNORF9QQ0lfUVVJUksoMHgxMGVjLCAw
eDIwNzMsICJJbnRlbCBOVUM4IEhhZGVzIENhbnlvbiIsIEFMQzcwMF9GSVhVUF9OVUNfU1BE
SUYpLAogCVNORF9QQ0lfUVVJUksoMHgxMGVjLCAweDExOGMsICJNZWRpb24gRUU0MjU0IE1E
NjIxMDAiLCBBTEMyNTZfRklYVVBfTUVESU9OX0hFQURTRVRfTk9fUFJFU0VOQ0UpLAogCVNO
RF9QQ0lfUVVJUksoMHgxMGVjLCAweDEyMzAsICJJbnRlbCBSZWZlcmVuY2UgYm9hcmQiLCBB
TEMyOTVfRklYVVBfQ0hST01FX0JPT0spLAogCVNORF9QQ0lfUVVJUksoMHgxMGVjLCAweDEy
NTIsICJJbnRlbCBSZWZlcmVuY2UgYm9hcmQiLCBBTEMyOTVfRklYVVBfQ0hST01FX0JPT0sp
LApAQCAtOTQ0NSw2ICs5NDU5LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBoZGFfbW9kZWxf
Zml4dXAgYWxjMjY5X2ZpeHVwX21vZGVsc1tdID0gewogCXsuaWQgPSBBTEMyOThfRklYVVBf
VFBUNDcwX0RPQ0ssIC5uYW1lID0gInRwdDQ3MC1kb2NrIn0sCiAJey5pZCA9IEFMQzIzM19G
SVhVUF9MRU5PVk9fTVVMVElfQ09ERUNTLCAubmFtZSA9ICJkdWFsLWNvZGVjcyJ9LAogCXsu
aWQgPSBBTEM3MDBfRklYVVBfSU5URUxfUkVGRVJFTkNFLCAubmFtZSA9ICJhbGM3MDAtcmVm
In0sCisJey5pZCA9IEFMQzcwMF9GSVhVUF9OVUNfU1BESUYsIC5uYW1lID0gIm51Yy1oYyJ9
LAogCXsuaWQgPSBBTEMyNjlfRklYVVBfU09OWV9WQUlPLCAubmFtZSA9ICJ2YWlvIn0sCiAJ
ey5pZCA9IEFMQzI2OV9GSVhVUF9ERUxMX00xMDFaLCAubmFtZSA9ICJkZWxsLW0xMDF6In0s
CiAJey5pZCA9IEFMQzI2OV9GSVhVUF9BU1VTX0c3M0pXLCAubmFtZSA9ICJhc3VzLWc3M2p3
In0sCg==

--------------38fIC0kcIjW30x7NSyUddUFr--
