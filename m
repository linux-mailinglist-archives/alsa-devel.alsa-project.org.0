Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D7B2531DC6
	for <lists+alsa-devel@lfdr.de>; Mon, 23 May 2022 23:30:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E1BBE16D9;
	Mon, 23 May 2022 23:29:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E1BBE16D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653341411;
	bh=gnuxEhwO2RthAttJQdAVkCqiWPejMEv5A32/MTXdCtU=;
	h=Date:From:Subject:To:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mcfZNMz7itTty+B2tWBjZIkGcPaKqFAtNU3JWdTtlfHawKB/uXyZR3Xk33Vy2ncsB
	 zriz867K0L/7JMGxSnLsTTSJlRMUYGtgw7v46UgXlimEGU16rO9Ct6VtFSth6hvXkl
	 fgpJgjDXcyvphqxs4E01UzLT7w739qge91fvOm6w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 51B71F800E3;
	Mon, 23 May 2022 23:29:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 092FAF80236; Mon, 23 May 2022 23:29:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=KHOP_HELO_FCRDNS, NICE_REPLY_A,
 PRX_BODY_32,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from relay5.hostedemail.com (smtprelay0011.hostedemail.com
 [216.40.44.11])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2674AF800E3
 for <alsa-devel@alsa-project.org>; Mon, 23 May 2022 23:28:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2674AF800E3
Received: from omf09.hostedemail.com (a10.router.float.18 [10.200.18.1])
 by unirelay12.hostedemail.com (Postfix) with ESMTP id BE51312112B;
 Mon, 23 May 2022 21:28:56 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: dag@bakke.com) by
 omf09.hostedemail.com (Postfix) with ESMTPA id D973F2002C; 
 Mon, 23 May 2022 21:28:55 +0000 (UTC)
Content-Type: multipart/mixed; boundary="------------0MOzVkDw1A0j5KelePW9E7SN"
Message-ID: <091a2af3-ff49-97b7-faa5-4527fb70d758@bakke.com>
Date: Mon, 23 May 2022 23:29:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
From: Dag B <dag@bakke.com>
Subject: Re: [PATCH] Enable SPDIF output on Intel Hades Canyon
To: alsa-devel@alsa-project.org
References: <5d5924ee-a52a-04f0-5080-2b8d91bce5ba@bakke.com>
 <3526166d-15ce-5260-200e-5c1650388956@linux.intel.com>
Content-Language: en-US
In-Reply-To: <3526166d-15ce-5260-200e-5c1650388956@linux.intel.com>
X-Rspamd-Server: rspamout07
X-Rspamd-Queue-Id: D973F2002C
X-Stat-Signature: caqyez463sydmbkcwwtawhbnimukiimy
X-Session-Marker: 6461674062616B6B652E636F6D
X-Session-ID: U2FsdGVkX18qfCul49A7dP4VgK2a4IzFDw8N0X5qnis=
X-HE-Tag: 1653341335-258922
Cc: tiwai@suse.com, pierre-louis.bossart@linux.intel.com
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
--------------0MOzVkDw1A0j5KelePW9E7SN
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23.05.2022 22:30, Pierre-Louis Bossart wrote:
> On 5/23/22 15:20, Dag B wrote:
>> Without the attached patch, the s/pdif output on the Hades Canyon NUC
>> does not work.
>>
>> "Well known" issue, less known fix. As far as I can tell, there is no
>> risk of any averse side-effects. But a bonus fix is enabling on-wire
>> headset microphone, by chaining the right 'model' choice for the hardware.
>>
>> If I should Cc: someone directly for this patch to be picked up, please
>> let me know.
>>
>>
>> I have been running with this patch for half a year or so.
>>
>> Patch passes checkpatch.pl
>>
>> Patch is based on what 'cyber4o' posted on the insanelymac forum [1].
>> All the glory to this person, any error is likely mine.
> Thanks for the patch.
>
> You would need a Signed-off-by tag for this patch, and CC: Takashi (added)
>
> +	[ALC700_FIXUP_NUC_SPDIF] = {
>
> Maybe use HC_NUC, there are multiple versions of those devices?
>
> +		.type = HDA_FIXUP_FUNC,
> +		.v.func = alc700_fixup_nuc_spdif,
>
> alc700_fixup_hc_nuc_spdif ?
>
> +		.chained = true,
> +		.chain_id = ALC269_FIXUP_DELL1_MIC_NO_PRESENCE,
>
> that chain_id doesn't seem quite right?
>
Thank you for reviewing this. I have made adjustments as suggested. Revised patch attached.
   

The chain_id may appear odd, I can assure you that it does the job. I picked up the suggestion from the excellent Arch Linux wiki:

https://wiki.archlinux.org/title/Intel_NUC#Hades_Canyon_NUC_-_No_External_Microphones

So my patch equates to:

a) creating a fixup for enabling spdif

and

b) making the new "model=nuc-hc" equate to the spdif fix + "model=dell-headset-multi"

I hope this is acceptable. As stated, I have used this solution for half a year or so.

|Signed-off-by: Dag Bakke <dag@bakke.com>|

Dag B



>> Some other users with issues: [2] [3]
>>
>>
>> Dag Bakke
>>
>>
>> [1]
>> https://www.insanelymac.com/forum/topic/339291-guide-hac-mini-osx-mojave-on-intel-hades-canyon-nuc8i7hvknuc8i7hnk/page/8/
>>
>>
>> 2]https://bbs.archlinux.org/viewtopic.php?id=270917
>>
>> [3]
>> https://www.reddit.com/r/intelnuc/comments/9ft9x8/any_linux_users_got_the_spdif_toslink_to_work_on/
>>
>>
>>
--------------0MOzVkDw1A0j5KelePW9E7SN
Content-Type: text/x-patch; charset=UTF-8; name="patch_realtek.c.diff"
Content-Disposition: attachment; filename="patch_realtek.c.diff"
Content-Transfer-Encoding: base64

ZGlmZiAtLWdpdCBhL3NvdW5kL3BjaS9oZGEvcGF0Y2hfcmVhbHRlay5jIGIvc291bmQvcGNp
L2hkYS9wYXRjaF9yZWFsdGVrLmMKaW5kZXggYWQyOTJkZjdkODA1Li5jZDZhMmNiNGMzODEg
MTAwNjQ0Ci0tLSBhL3NvdW5kL3BjaS9oZGEvcGF0Y2hfcmVhbHRlay5jCisrKyBiL3NvdW5k
L3BjaS9oZGEvcGF0Y2hfcmVhbHRlay5jCkBAIC00NzUyLDYgKzQ3NTIsMTIgQEAgc3RhdGlj
IHZvaWQgYWxjMjgwX2ZpeHVwX2hwX2dwaW8yX21pY19ob3RrZXkoc3RydWN0IGhkYV9jb2Rl
YyAqY29kZWMsCiAJfQogfQogCitzdGF0aWMgdm9pZCBhbGM3MDBfZml4dXBfaGNfbnVjX3Nw
ZGlmKHN0cnVjdCBoZGFfY29kZWMgKmNvZGVjLAorCQkJCWNvbnN0IHN0cnVjdCBoZGFfZml4
dXAgKmZpeCwgaW50IGFjdGlvbikKK3sKKwlzbmRfaGRhX292ZXJyaWRlX3djYXBzKGNvZGVj
LCAweDYsIDB4NjExKTsKK30KKwogLyogTGluZTIgPSBtaWMgbXV0ZSBob3RrZXkKICAqIEdQ
SU8yID0gbWljIG11dGUgTEVECiAgKi8KQEAgLTU3OTIsNyArNTc5OCw3IEBAIHN0YXRpYyB2
b2lkIGFsY19maXh1cF9oZWFkc2V0X21vZGVfYWxjMjU1X25vX2hwX21pYyhzdHJ1Y3QgaGRh
X2NvZGVjICpjb2RlYywKIAkJc3RydWN0IGFsY19zcGVjICpzcGVjID0gY29kZWMtPnNwZWM7
CiAJCXNwZWMtPnBhcnNlX2ZsYWdzIHw9IEhEQV9QSU5DRkdfSEVBRFNFVF9NSUM7CiAJCWFs
YzI1NV9zZXRfZGVmYXVsdF9qYWNrX3R5cGUoY29kZWMpOwotCX0gCisJfQogCWVsc2UKIAkJ
YWxjX2ZpeHVwX2hlYWRzZXRfbW9kZShjb2RlYywgZml4LCBhY3Rpb24pOwogfQpAQCAtNjkz
OSw2ICs2OTQ1LDcgQEAgZW51bSB7CiAJQUxDMjI1X0ZJWFVQX0RFTExfV1lTRV9NSUNfTk9f
UFJFU0VOQ0UsCiAJQUxDMjI1X0ZJWFVQX1MzX1BPUF9OT0lTRSwKIAlBTEM3MDBfRklYVVBf
SU5URUxfUkVGRVJFTkNFLAorCUFMQzcwMF9GSVhVUF9IQ19OVUNfU1BESUYsCiAJQUxDMjc0
X0ZJWFVQX0RFTExfQklORF9EQUNTLAogCUFMQzI3NF9GSVhVUF9ERUxMX0FJT19MSU5FT1VU
X1ZFUkIsCiAJQUxDMjk4X0ZJWFVQX1RQVDQ3MF9ET0NLX0ZJWCwKQEAgLTcyNjAsNiArNzI2
NywxMiBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGhkYV9maXh1cCBhbGMyNjlfZml4dXBzW10g
PSB7CiAJCS5jaGFpbmVkID0gdHJ1ZSwKIAkJLmNoYWluX2lkID0gQUxDMjY5X0ZJWFVQX1RI
SU5LUEFEX0FDUEksCiAJfSwKKwlbQUxDNzAwX0ZJWFVQX0hDX05VQ19TUERJRl0gPSB7CisJ
CS50eXBlID0gSERBX0ZJWFVQX0ZVTkMsCisJCS52LmZ1bmMgPSBhbGM3MDBfZml4dXBfaGNf
bnVjX3NwZGlmLAorCQkuY2hhaW5lZCA9IHRydWUsCisJCS5jaGFpbl9pZCA9IEFMQzI2OV9G
SVhVUF9ERUxMMV9NSUNfTk9fUFJFU0VOQ0UsCisJfSwKIAlbQUxDMjY5X0ZJWFVQX0RFTEwx
X01JQ19OT19QUkVTRU5DRV0gPSB7CiAJCS50eXBlID0gSERBX0ZJWFVQX1BJTlMsCiAJCS52
LnBpbnMgPSAoY29uc3Qgc3RydWN0IGhkYV9waW50YmxbXSkgewpAQCAtOTE1OSw2ICs5MTcy
LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBzbmRfcGNpX3F1aXJrIGFsYzI2OV9maXh1cF90
YmxbXSA9IHsKIAlTTkRfUENJX1FVSVJLKDB4MTBjZiwgMHgxNzU3LCAiTGlmZWJvb2sgRTc1
MiIsIEFMQzI2OV9GSVhVUF9MSUZFQk9PS19IUF9QSU4pLAogCVNORF9QQ0lfUVVJUksoMHgx
MGNmLCAweDE4NDUsICJMaWZlYm9vayBVOTA0IiwgQUxDMjY5X0ZJWFVQX0xJRkVCT09LX0VY
VE1JQyksCiAJU05EX1BDSV9RVUlSSygweDEwZWMsIDB4MTBmMiwgIkludGVsIFJlZmVyZW5j
ZSBib2FyZCIsIEFMQzcwMF9GSVhVUF9JTlRFTF9SRUZFUkVOQ0UpLAorCVNORF9QQ0lfUVVJ
UksoMHgxMGVjLCAweDIwNzMsICJJbnRlbCBOVUM4IEhhZGVzIENhbnlvbiIsIEFMQzcwMF9G
SVhVUF9IQ19OVUNfU1BESUYpLAogCVNORF9QQ0lfUVVJUksoMHgxMGVjLCAweDExOGMsICJN
ZWRpb24gRUU0MjU0IE1ENjIxMDAiLCBBTEMyNTZfRklYVVBfTUVESU9OX0hFQURTRVRfTk9f
UFJFU0VOQ0UpLAogCVNORF9QQ0lfUVVJUksoMHgxMGVjLCAweDEyMzAsICJJbnRlbCBSZWZl
cmVuY2UgYm9hcmQiLCBBTEMyOTVfRklYVVBfQ0hST01FX0JPT0spLAogCVNORF9QQ0lfUVVJ
UksoMHgxMGVjLCAweDEyNTIsICJJbnRlbCBSZWZlcmVuY2UgYm9hcmQiLCBBTEMyOTVfRklY
VVBfQ0hST01FX0JPT0spLApAQCAtOTQ0NSw2ICs5NDU5LDcgQEAgc3RhdGljIGNvbnN0IHN0
cnVjdCBoZGFfbW9kZWxfZml4dXAgYWxjMjY5X2ZpeHVwX21vZGVsc1tdID0gewogCXsuaWQg
PSBBTEMyOThfRklYVVBfVFBUNDcwX0RPQ0ssIC5uYW1lID0gInRwdDQ3MC1kb2NrIn0sCiAJ
ey5pZCA9IEFMQzIzM19GSVhVUF9MRU5PVk9fTVVMVElfQ09ERUNTLCAubmFtZSA9ICJkdWFs
LWNvZGVjcyJ9LAogCXsuaWQgPSBBTEM3MDBfRklYVVBfSU5URUxfUkVGRVJFTkNFLCAubmFt
ZSA9ICJhbGM3MDAtcmVmIn0sCisJey5pZCA9IEFMQzcwMF9GSVhVUF9IQ19OVUNfU1BESUYs
IC5uYW1lID0gIm51Yy1oYyJ9LAogCXsuaWQgPSBBTEMyNjlfRklYVVBfU09OWV9WQUlPLCAu
bmFtZSA9ICJ2YWlvIn0sCiAJey5pZCA9IEFMQzI2OV9GSVhVUF9ERUxMX00xMDFaLCAubmFt
ZSA9ICJkZWxsLW0xMDF6In0sCiAJey5pZCA9IEFMQzI2OV9GSVhVUF9BU1VTX0c3M0pXLCAu
bmFtZSA9ICJhc3VzLWc3M2p3In0sCg==

--------------0MOzVkDw1A0j5KelePW9E7SN--
