Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C7353238C
	for <lists+alsa-devel@lfdr.de>; Tue, 24 May 2022 08:59:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 008BA170D;
	Tue, 24 May 2022 08:58:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 008BA170D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653375551;
	bh=bR5XYZ1TIW0DM+kp6paqmkwUTlt8FhoMef4qy6qncvE=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VQp+MM1oD/WEnoOIjaIAkey0FG5+3wGOwTVCIx7t5dPq/qP4pU6qGcPzvMk/S+k/C
	 sIw5jbpl63b7EoZsM/89RMhVDg4Gkb7DtBGrlwr3TxIzZlsQsAyaxgMfCagkipnxCH
	 VN9wuSZmt1Yk2zMtcckHfYejhVZO3RUSnz/ATr2A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5A1A8F804D6;
	Tue, 24 May 2022 08:58:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 397C2F804D1; Tue, 24 May 2022 08:58:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.7 required=5.0 tests=FORGED_SPF_HELO,
 KHOP_HELO_FCRDNS,NICE_REPLY_A,PRX_BODY_32,SPF_HELO_PASS,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from relay3.hostedemail.com (smtprelay0011.hostedemail.com
 [216.40.44.11])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 59BA6F80100
 for <alsa-devel@alsa-project.org>; Tue, 24 May 2022 08:58:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 59BA6F80100
Received: from omf02.hostedemail.com (a10.router.float.18 [10.200.18.1])
 by unirelay07.hostedemail.com (Postfix) with ESMTP id 9297C2144C;
 Tue, 24 May 2022 06:58:00 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: dag@bakke.com) by
 omf02.hostedemail.com (Postfix) with ESMTPA id 9DB7E8000E; 
 Tue, 24 May 2022 06:57:59 +0000 (UTC)
Content-Type: multipart/mixed; boundary="------------5UnzxD6I5rfSFesscZ1jwNeL"
Message-ID: <8f06189e-6305-853d-f925-9b183d087988@bakke.com>
Date: Tue, 24 May 2022 08:58:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] Enable SPDIF output on Intel Hades Canyon
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
References: <5d5924ee-a52a-04f0-5080-2b8d91bce5ba@bakke.com>
 <3526166d-15ce-5260-200e-5c1650388956@linux.intel.com>
 <091a2af3-ff49-97b7-faa5-4527fb70d758@bakke.com>
 <5224aed8-02ed-6cac-50bd-999404324c65@linux.intel.com>
From: Dag B <dag@bakke.com>
In-Reply-To: <5224aed8-02ed-6cac-50bd-999404324c65@linux.intel.com>
X-Rspamd-Server: rspamout07
X-Rspamd-Queue-Id: 9DB7E8000E
X-Stat-Signature: ushjwb9n1trrcjfoacpf11ub3qwxqntn
X-Session-Marker: 6461674062616B6B652E636F6D
X-Session-ID: U2FsdGVkX1/miPp62u1DYbuSNdQkqJ1m9m1xNS4Pwds=
X-HE-Tag: 1653375479-165486
Cc: tiwai@suse.com
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
--------------5UnzxD6I5rfSFesscZ1jwNeL
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 23.05.2022 23:53, Pierre-Louis Bossart wrote:

>
> On 5/23/22 16:29, Dag B wrote:
>> On 23.05.2022 22:30, Pierre-Louis Bossart wrote:
>>> On 5/23/22 15:20, Dag B wrote:
>>>> Without the attached patch, the s/pdif output on the Hades Canyon NUC
>>>> does not work.
>>>>
>>>> "Well known" issue, less known fix. As far as I can tell, there is no
>>>> risk of any averse side-effects. But a bonus fix is enabling on-wire
>>>> headset microphone, by chaining the right 'model' choice for the
>>>> hardware.
>>>>
>>>> If I should Cc: someone directly for this patch to be picked up, please
>>>> let me know.
>>>>
>>>>
>>>> I have been running with this patch for half a year or so.
>>>>
>>>> Patch passes checkpatch.pl
>>>>
>>>> Patch is based on what 'cyber4o' posted on the insanelymac forum [1].
>>>> All the glory to this person, any error is likely mine.
>>> Thanks for the patch.
>>>
>>> You would need a Signed-off-by tag for this patch, and CC: Takashi
>>> (added)
>>>
>>> +    [ALC700_FIXUP_NUC_SPDIF] = {
>>>
>>> Maybe use HC_NUC, there are multiple versions of those devices?
>>>
>>> +        .type = HDA_FIXUP_FUNC,
>>> +        .v.func = alc700_fixup_nuc_spdif,
>>>
>>> alc700_fixup_hc_nuc_spdif ?
>>>
>>> +        .chained = true,
>>> +        .chain_id = ALC269_FIXUP_DELL1_MIC_NO_PRESENCE,
>>>
>>> that chain_id doesn't seem quite right?
>>>
>> Thank you for reviewing this. I have made adjustments as suggested.
>> Revised patch attached.
>>   
>> The chain_id may appear odd, I can assure you that it does the job. I
>> picked up the suggestion from the excellent Arch Linux wiki:
>>
>> https://wiki.archlinux.org/title/Intel_NUC#Hades_Canyon_NUC_-_No_External_Microphones
> Parts of my comment was the reference to ALC269 when this is an ALC700,
> but it seems the two parts are identical if I understand this
> definition well:	
>
> ALC269_TYPE_ALC700,
>
> The other point was the reference to Dell when this isn't a Dell
> platform. ALC269_FIXUP_DELL1_MIC_NO_PRESENCE may do the job but so far
> it's only used for Dell platforms, so it's a bit confusing.

Actually, it is already used for Skull Canyon. So there is precedence.   :-)

>
>> So my patch equates to:
>>
>> a) creating a fixup for enabling spdif
>>
>> and
>>
>> b) making the new "model=nuc-hc" equate to the spdif fix +
>> "model=dell-headset-multi"
>>
>> I hope this is acceptable. As stated, I have used this solution for half
>> a year or so.
>>
>> |Signed-off-by: Dag Bakke <dag@bakke.com>|
> usually this comes inside the patch with a git commit title and message.

Better now?



>
>> Dag B
>>
>>
>>
>>>> Some other users with issues: [2] [3]
>>>>
>>>>
>>>> Dag Bakke
>>>>
>>>>
>>>> [1]
>>>> https://www.insanelymac.com/forum/topic/339291-guide-hac-mini-osx-mojave-on-intel-hades-canyon-nuc8i7hvknuc8i7hnk/page/8/
>>>>
>>>>
>>>>
>>>> 2]https://bbs.archlinux.org/viewtopic.php?id=270917
>>>>
>>>> [3]
>>>> https://www.reddit.com/r/intelnuc/comments/9ft9x8/any_linux_users_got_the_spdif_toslink_to_work_on/
>>>>
>>>>
>>>>
>>>>
--------------5UnzxD6I5rfSFesscZ1jwNeL
Content-Type: text/x-patch; charset=UTF-8; name="patch_realtek.c.diff"
Content-Disposition: attachment; filename="patch_realtek.c.diff"
Content-Transfer-Encoding: base64

RnJvbSBmZTU2MmUzOTFiNTIyZGNhMDlmMDBhNWY4YzI4MGFiNDMxMzZlZjFmIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBEYWcgQiA8ZGFnQGJha2tlLmNvbT4KRGF0ZTogVHVl
LCAyNCBNYXkgMjAyMiAwODozODo0MiArMDIwMApTdWJqZWN0OiBbUEFUQ0hdIEVuYWJsZSBJ
bnRlbCBIYWRlcyBDYW55b24gU1BESUYKClNpZ25lZC1vZmYtYnk6IERhZyBCIDxkYWdAYmFr
a2UuY29tPgotLS0KIHNvdW5kL3BjaS9oZGEvcGF0Y2hfcmVhbHRlay5jIHwgMTcgKysrKysr
KysrKysrKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspLCAxIGRlbGV0
aW9uKC0pCgpkaWZmIC0tZ2l0IGEvc291bmQvcGNpL2hkYS9wYXRjaF9yZWFsdGVrLmMgYi9z
b3VuZC9wY2kvaGRhL3BhdGNoX3JlYWx0ZWsuYwppbmRleCBhZDI5MmRmN2Q4MDUuLmNkNmEy
Y2I0YzM4MSAxMDA2NDQKLS0tIGEvc291bmQvcGNpL2hkYS9wYXRjaF9yZWFsdGVrLmMKKysr
IGIvc291bmQvcGNpL2hkYS9wYXRjaF9yZWFsdGVrLmMKQEAgLTQ3NTIsNiArNDc1MiwxMiBA
QCBzdGF0aWMgdm9pZCBhbGMyODBfZml4dXBfaHBfZ3BpbzJfbWljX2hvdGtleShzdHJ1Y3Qg
aGRhX2NvZGVjICpjb2RlYywKIAl9CiB9CiAKK3N0YXRpYyB2b2lkIGFsYzcwMF9maXh1cF9o
Y19udWNfc3BkaWYoc3RydWN0IGhkYV9jb2RlYyAqY29kZWMsCisJCQkJY29uc3Qgc3RydWN0
IGhkYV9maXh1cCAqZml4LCBpbnQgYWN0aW9uKQoreworCXNuZF9oZGFfb3ZlcnJpZGVfd2Nh
cHMoY29kZWMsIDB4NiwgMHg2MTEpOworfQorCiAvKiBMaW5lMiA9IG1pYyBtdXRlIGhvdGtl
eQogICogR1BJTzIgPSBtaWMgbXV0ZSBMRUQKICAqLwpAQCAtNTc5Miw3ICs1Nzk4LDcgQEAg
c3RhdGljIHZvaWQgYWxjX2ZpeHVwX2hlYWRzZXRfbW9kZV9hbGMyNTVfbm9faHBfbWljKHN0
cnVjdCBoZGFfY29kZWMgKmNvZGVjLAogCQlzdHJ1Y3QgYWxjX3NwZWMgKnNwZWMgPSBjb2Rl
Yy0+c3BlYzsKIAkJc3BlYy0+cGFyc2VfZmxhZ3MgfD0gSERBX1BJTkNGR19IRUFEU0VUX01J
QzsKIAkJYWxjMjU1X3NldF9kZWZhdWx0X2phY2tfdHlwZShjb2RlYyk7Ci0JfSAKKwl9CiAJ
ZWxzZQogCQlhbGNfZml4dXBfaGVhZHNldF9tb2RlKGNvZGVjLCBmaXgsIGFjdGlvbik7CiB9
CkBAIC02OTM5LDYgKzY5NDUsNyBAQCBlbnVtIHsKIAlBTEMyMjVfRklYVVBfREVMTF9XWVNF
X01JQ19OT19QUkVTRU5DRSwKIAlBTEMyMjVfRklYVVBfUzNfUE9QX05PSVNFLAogCUFMQzcw
MF9GSVhVUF9JTlRFTF9SRUZFUkVOQ0UsCisJQUxDNzAwX0ZJWFVQX0hDX05VQ19TUERJRiwK
IAlBTEMyNzRfRklYVVBfREVMTF9CSU5EX0RBQ1MsCiAJQUxDMjc0X0ZJWFVQX0RFTExfQUlP
X0xJTkVPVVRfVkVSQiwKIAlBTEMyOThfRklYVVBfVFBUNDcwX0RPQ0tfRklYLApAQCAtNzI2
MCw2ICs3MjY3LDEyIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgaGRhX2ZpeHVwIGFsYzI2OV9m
aXh1cHNbXSA9IHsKIAkJLmNoYWluZWQgPSB0cnVlLAogCQkuY2hhaW5faWQgPSBBTEMyNjlf
RklYVVBfVEhJTktQQURfQUNQSSwKIAl9LAorCVtBTEM3MDBfRklYVVBfSENfTlVDX1NQRElG
XSA9IHsKKwkJLnR5cGUgPSBIREFfRklYVVBfRlVOQywKKwkJLnYuZnVuYyA9IGFsYzcwMF9m
aXh1cF9oY19udWNfc3BkaWYsCisJCS5jaGFpbmVkID0gdHJ1ZSwKKwkJLmNoYWluX2lkID0g
QUxDMjY5X0ZJWFVQX0RFTEwxX01JQ19OT19QUkVTRU5DRSwKKwl9LAogCVtBTEMyNjlfRklY
VVBfREVMTDFfTUlDX05PX1BSRVNFTkNFXSA9IHsKIAkJLnR5cGUgPSBIREFfRklYVVBfUElO
UywKIAkJLnYucGlucyA9IChjb25zdCBzdHJ1Y3QgaGRhX3BpbnRibFtdKSB7CkBAIC05MTU5
LDYgKzkxNzIsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHNuZF9wY2lfcXVpcmsgYWxjMjY5
X2ZpeHVwX3RibFtdID0gewogCVNORF9QQ0lfUVVJUksoMHgxMGNmLCAweDE3NTcsICJMaWZl
Ym9vayBFNzUyIiwgQUxDMjY5X0ZJWFVQX0xJRkVCT09LX0hQX1BJTiksCiAJU05EX1BDSV9R
VUlSSygweDEwY2YsIDB4MTg0NSwgIkxpZmVib29rIFU5MDQiLCBBTEMyNjlfRklYVVBfTElG
RUJPT0tfRVhUTUlDKSwKIAlTTkRfUENJX1FVSVJLKDB4MTBlYywgMHgxMGYyLCAiSW50ZWwg
UmVmZXJlbmNlIGJvYXJkIiwgQUxDNzAwX0ZJWFVQX0lOVEVMX1JFRkVSRU5DRSksCisJU05E
X1BDSV9RVUlSSygweDEwZWMsIDB4MjA3MywgIkludGVsIE5VQzggSGFkZXMgQ2FueW9uIiwg
QUxDNzAwX0ZJWFVQX0hDX05VQ19TUERJRiksCiAJU05EX1BDSV9RVUlSSygweDEwZWMsIDB4
MTE4YywgIk1lZGlvbiBFRTQyNTQgTUQ2MjEwMCIsIEFMQzI1Nl9GSVhVUF9NRURJT05fSEVB
RFNFVF9OT19QUkVTRU5DRSksCiAJU05EX1BDSV9RVUlSSygweDEwZWMsIDB4MTIzMCwgIklu
dGVsIFJlZmVyZW5jZSBib2FyZCIsIEFMQzI5NV9GSVhVUF9DSFJPTUVfQk9PSyksCiAJU05E
X1BDSV9RVUlSSygweDEwZWMsIDB4MTI1MiwgIkludGVsIFJlZmVyZW5jZSBib2FyZCIsIEFM
QzI5NV9GSVhVUF9DSFJPTUVfQk9PSyksCkBAIC05NDQ1LDYgKzk0NTksNyBAQCBzdGF0aWMg
Y29uc3Qgc3RydWN0IGhkYV9tb2RlbF9maXh1cCBhbGMyNjlfZml4dXBfbW9kZWxzW10gPSB7
CiAJey5pZCA9IEFMQzI5OF9GSVhVUF9UUFQ0NzBfRE9DSywgLm5hbWUgPSAidHB0NDcwLWRv
Y2sifSwKIAl7LmlkID0gQUxDMjMzX0ZJWFVQX0xFTk9WT19NVUxUSV9DT0RFQ1MsIC5uYW1l
ID0gImR1YWwtY29kZWNzIn0sCiAJey5pZCA9IEFMQzcwMF9GSVhVUF9JTlRFTF9SRUZFUkVO
Q0UsIC5uYW1lID0gImFsYzcwMC1yZWYifSwKKwl7LmlkID0gQUxDNzAwX0ZJWFVQX0hDX05V
Q19TUERJRiwgLm5hbWUgPSAibnVjLWhjIn0sCiAJey5pZCA9IEFMQzI2OV9GSVhVUF9TT05Z
X1ZBSU8sIC5uYW1lID0gInZhaW8ifSwKIAl7LmlkID0gQUxDMjY5X0ZJWFVQX0RFTExfTTEw
MVosIC5uYW1lID0gImRlbGwtbTEwMXoifSwKIAl7LmlkID0gQUxDMjY5X0ZJWFVQX0FTVVNf
RzczSlcsIC5uYW1lID0gImFzdXMtZzczancifSwKLS0gCjIuMzUuMQoK

--------------5UnzxD6I5rfSFesscZ1jwNeL--
