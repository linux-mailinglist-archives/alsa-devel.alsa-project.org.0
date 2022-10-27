Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 78BE3610234
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Oct 2022 21:59:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 11471299D;
	Thu, 27 Oct 2022 21:58:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 11471299D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666900756;
	bh=ro3n7HKvmvm/84Q+8n461KOMKj2+qybdODsBIjKJvjY=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=goh9XUJ/ZUbxviudxH7g+5Rc2wzd02kQlwV99SQsnza17bBsH55ebmODP7kAI6rLY
	 xo1gH+Gw1WuyNO+oSEnJlm9gRrEXlqmY1Gf9ERG9cgOkxOhzcl2SSWqB/GD2GIGt2G
	 66dlTdSUWHnW/S0+ZFIUqgHiHMfsGeztq6tOHcKU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6A5F9F80496;
	Thu, 27 Oct 2022 21:58:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D9105F80100; Thu, 27 Oct 2022 21:58:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 31F36F80100
 for <alsa-devel@alsa-project.org>; Thu, 27 Oct 2022 21:58:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 31F36F80100
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="SxfNj10f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666900694; x=1698436694;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to;
 bh=ro3n7HKvmvm/84Q+8n461KOMKj2+qybdODsBIjKJvjY=;
 b=SxfNj10fHjBZcj10e7TCyNHiJcZIMBkTN4tQ4UTzdrYpGAinKMKMkosq
 ZigROEoFv+iluyF08htW/IVjKMUvV0Wuy3WbfrauMMd66m3oi01bnDiUF
 FAGpRZeb/Vjc3FJmB3zD52gOP52WPK4+/S3NTRrwnvwRQhSrlqKAsMIev
 5ZYuNq06x1YrLp016LRbQGQKzHrQKLwDPOBw7WWG7T9nsZOkE1pKemPSy
 XaYZ67VoqDaKhYgIyjScEaOJ8XpFbVYbMgCI0HSFIiBTrdbC/O3dI2OiC
 6/+oDgOGv6YC/6FTDKpeXhEBLKrdKXABO5E8dyXqFhpgu6htkPI+XFxAT A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10513"; a="372539084"
X-IronPort-AV: E=Sophos;i="5.95,218,1661842800"; 
 d="diff'?scan'208";a="372539084"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2022 12:58:10 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10513"; a="701477335"
X-IronPort-AV: E=Sophos;i="5.95,218,1661842800"; 
 d="diff'?scan'208";a="701477335"
Received: from unknown (HELO [10.212.12.162]) ([10.212.12.162])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2022 12:58:09 -0700
Content-Type: multipart/mixed; boundary="------------00y1iE8sMDyBdJ8uYcjX0kN8"
Message-ID: <e3c4866f-54ab-bdd1-4ecf-504e947f8028@linux.intel.com>
Date: Thu, 27 Oct 2022 15:58:08 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.2.2
Subject: Re: [PATCH 03/16] ASoC: SOF: ops: add readb/writeb helpers
Content-Language: en-US
To: Nathan Chancellor <nathan@kernel.org>
References: <20221024165310.246183-1-pierre-louis.bossart@linux.intel.com>
 <20221024165310.246183-4-pierre-louis.bossart@linux.intel.com>
 <Y1rTFrohLqaiZAy/@dev-arch.thelio-3990X>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <Y1rTFrohLqaiZAy/@dev-arch.thelio-3990X>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>, broonie@kernel.org,
 =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
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
--------------00y1iE8sMDyBdJ8uYcjX0kN8
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 10/27/22 14:51, Nathan Chancellor wrote:
> Hi Pierre-Louis,
> 
> On Mon, Oct 24, 2022 at 11:52:57AM -0500, Pierre-Louis Bossart wrote:
>> These will be used to add more consistency in the SOF core and
>> drivers.
>>
>> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>> Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
>> Reviewed-by: Rander Wang <rander.wang@intel.com>
>> Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
> 
> This change is now in -next as commit 74fe0c4dcb41 ("ASoC: SOF: ops: add
> readb/writeb helpers"), where it breaks the build badly on at least
> ARCH=arm:
> 
> $ kmake ARCH=arm CROSS_COMPILE=arm-linux-gnu- allmodconfig sound/soc/sof/
> ...
> In file included from sound/soc/sof/sof-client.c:16:
> sound/soc/sof/ops.h: In function ‘snd_sof_dsp_writeb’:
> sound/soc/sof/ops.h:309:75: error: macro "writeb" passed 3 arguments, but takes just 2
>   309 |                 sof_ops(sdev)->writeb(sdev, sdev->bar[bar] + offset, value);
>       |                                                                           ^
> In file included from ./include/linux/io.h:13,
>                  from ./include/linux/irq.h:20,
>                  from ./include/asm-generic/hardirq.h:17,
>                  from ./arch/arm/include/asm/hardirq.h:10,
>                  from ./include/linux/hardirq.h:11,
>                  from ./include/linux/interrupt.h:11,
>                  from sound/soc/sof/ops.h:15:
> ./arch/arm/include/asm/io.h:288: note: macro "writeb" defined here
>   288 | #define writeb(v,c)             ({ __iowmb(); writeb_relaxed(v,c); })
>       |
> sound/soc/sof/ops.h:309:30: error: statement with no effect [-Werror=unused-value]
>   309 |                 sof_ops(sdev)->writeb(sdev, sdev->bar[bar] + offset, value);
>       |                              ^
> sound/soc/sof/ops.h: In function ‘snd_sof_dsp_readb’:
> sound/soc/sof/ops.h:336:74: error: macro "readb" passed 2 arguments, but takes just 1
>   336 |                 return sof_ops(sdev)->readb(sdev, sdev->bar[bar] + offset);
>       |                                                                          ^
> ./arch/arm/include/asm/io.h:284: note: macro "readb" defined here
>   284 | #define readb(c)                ({ u8  __v = readb_relaxed(c); __iormb(); __v; })
>       |
> sound/soc/sof/ops.h:336:37: error: returning ‘u8 (*)(struct snd_sof_dev *, void *)’ {aka ‘unsigned char (*)(struct snd_sof_dev *, void *)’} from a function with return type ‘u8’ {aka ‘unsigned char’} makes integer from pointer without a cast [-Werror=int-conversion]
>   336 |                 return sof_ops(sdev)->readb(sdev, sdev->bar[bar] + offset);
>       |                                     ^
> cc1: all warnings being treated as errors
> ...
> 
> I guess the preprocessor gets to these calls first and everything
> explodes from there. Perhaps these should be namespaced somehow?

Thanks for the report. We've had these patches for a while and always
compile for ARM, and didn't see any issues raised. Meh.

I don't have a strong appetite for changes in common parts, maybe it's
just simpler to use read8/write8 as callback names to avoid the
conflict, something like the patch attached (compile-tested only). In
hindsight it'd also be more consistent with the use of read64/write64
that was added earlier in SOF helpers.



--------------00y1iE8sMDyBdJ8uYcjX0kN8
Content-Type: text/x-patch; charset=UTF-8; name="readwrite8.diff"
Content-Disposition: attachment; filename="readwrite8.diff"
Content-Transfer-Encoding: base64

ZGlmZiAtLWdpdCBhL3NvdW5kL3NvYy9zb2YvaW50ZWwvaGRhLWRzcC5jIGIvc291bmQvc29j
L3NvZi9pbnRlbC9oZGEtZHNwLmMKaW5kZXggNmQ4OTZlYTMxNjgwLi5mZDcyZTc4ZDJkYTcg
MTAwNjQ0Ci0tLSBhL3NvdW5kL3NvYy9zb2YvaW50ZWwvaGRhLWRzcC5jCisrKyBiL3NvdW5k
L3NvYy9zb2YvaW50ZWwvaGRhLWRzcC5jCkBAIC0zNDksNyArMzQ5LDcgQEAgc3RhdGljIGlu
dCBoZGFfZHNwX3dhaXRfZDBpM2NfZG9uZShzdHJ1Y3Qgc25kX3NvZl9kZXYgKnNkZXYpCiB7
CiAJaW50IHJldHJ5ID0gSERBX0RTUF9SRUdfUE9MTF9SRVRSWV9DT1VOVDsKIAotCXdoaWxl
IChzbmRfc29mX2RzcF9yZWFkYihzZGV2LCBIREFfRFNQX0hEQV9CQVIsIFNPRl9IREFfVlNf
RDBJM0MpICYgU09GX0hEQV9WU19EMEkzQ19DSVApIHsKKwl3aGlsZSAoc25kX3NvZl9kc3Bf
cmVhZDgoc2RldiwgSERBX0RTUF9IREFfQkFSLCBTT0ZfSERBX1ZTX0QwSTNDKSAmIFNPRl9I
REFfVlNfRDBJM0NfQ0lQKSB7CiAJCWlmICghcmV0cnktLSkKIAkJCXJldHVybiAtRVRJTUVE
T1VUOwogCQl1c2xlZXBfcmFuZ2UoMTAsIDE1KTsKQEAgLTM5OSw3ICszOTksNyBAQCBzdGF0
aWMgaW50IGhkYV9kc3BfdXBkYXRlX2QwaTNjX3JlZ2lzdGVyKHN0cnVjdCBzbmRfc29mX2Rl
diAqc2RldiwgdTggdmFsdWUpCiAJCXJldHVybiByZXQ7CiAJfQogCi0JcmVnID0gc25kX3Nv
Zl9kc3BfcmVhZGIoc2RldiwgSERBX0RTUF9IREFfQkFSLCBTT0ZfSERBX1ZTX0QwSTNDKTsK
KwlyZWcgPSBzbmRfc29mX2RzcF9yZWFkOChzZGV2LCBIREFfRFNQX0hEQV9CQVIsIFNPRl9I
REFfVlNfRDBJM0MpOwogCXRyYWNlX3NvZl9pbnRlbF9EMEkzQ191cGRhdGVkKHNkZXYsIHJl
Zyk7CiAKIAlyZXR1cm4gMDsKZGlmZiAtLWdpdCBhL3NvdW5kL3NvYy9zb2YvaW50ZWwvaGRh
LmMgYi9zb3VuZC9zb2Mvc29mL2ludGVsL2hkYS5jCmluZGV4IDc5YzMyZDk0OGIyZC4uNTgz
MTAyOWIzMTI4IDEwMDY0NAotLS0gYS9zb3VuZC9zb2Mvc29mL2ludGVsL2hkYS5jCisrKyBi
L3NvdW5kL3NvYy9zb2YvaW50ZWwvaGRhLmMKQEAgLTYzNiw3ICs2MzYsNyBAQCB2b2lkIGhk
YV9pcGNfaXJxX2R1bXAoc3RydWN0IHNuZF9zb2ZfZGV2ICpzZGV2KQogCWludHN0cyA9IHNu
ZF9zb2ZfZHNwX3JlYWQoc2RldiwgSERBX0RTUF9IREFfQkFSLCBTT0ZfSERBX0lOVFNUUyk7
CiAJaW50Y3RsID0gc25kX3NvZl9kc3BfcmVhZChzZGV2LCBIREFfRFNQX0hEQV9CQVIsIFNP
Rl9IREFfSU5UQ1RMKTsKIAlwcHN0cyA9IHNuZF9zb2ZfZHNwX3JlYWQoc2RldiwgSERBX0RT
UF9QUF9CQVIsIFNPRl9IREFfUkVHX1BQX1BQU1RTKTsKLQlyaXJic3RzID0gc25kX3NvZl9k
c3BfcmVhZGIoc2RldiwgSERBX0RTUF9IREFfQkFSLCBBWlhfUkVHX1JJUkJTVFMpOworCXJp
cmJzdHMgPSBzbmRfc29mX2RzcF9yZWFkOChzZGV2LCBIREFfRFNQX0hEQV9CQVIsIEFaWF9S
RUdfUklSQlNUUyk7CiAKIAlkZXZfZXJyKHNkZXYtPmRldiwgImhkYSBpcnEgaW50c3RzIDB4
JTguOHggaW50bGN0bCAweCU4Ljh4IHJpcmIgJTIuMnhcbiIsCiAJCWludHN0cywgaW50Y3Rs
LCByaXJic3RzKTsKZGlmZiAtLWdpdCBhL3NvdW5kL3NvYy9zb2Yvb3BzLmggYi9zb3VuZC9z
b2Mvc29mL29wcy5oCmluZGV4IDhjYjkzZTdjMGM2Ny4uYWFjNTU4ZmM0M2FlIDEwMDY0NAot
LS0gYS9zb3VuZC9zb2Mvc29mL29wcy5oCisrKyBiL3NvdW5kL3NvYy9zb2Yvb3BzLmgKQEAg
LTMwMiwxMSArMzAyLDExIEBAIHN0YXRpYyBpbmxpbmUgaW50IHNuZF9zb2ZfZGVidWdmc19h
ZGRfcmVnaW9uX2l0ZW0oc3RydWN0IHNuZF9zb2ZfZGV2ICpzZGV2LAogfQogCiAvKiByZWdp
c3RlciBJTyAqLwotc3RhdGljIGlubGluZSB2b2lkIHNuZF9zb2ZfZHNwX3dyaXRlYihzdHJ1
Y3Qgc25kX3NvZl9kZXYgKnNkZXYsIHUzMiBiYXIsCitzdGF0aWMgaW5saW5lIHZvaWQgc25k
X3NvZl9kc3Bfd3JpdGU4KHN0cnVjdCBzbmRfc29mX2RldiAqc2RldiwgdTMyIGJhciwKIAkJ
CQkgICAgICB1MzIgb2Zmc2V0LCB1OCB2YWx1ZSkKIHsKLQlpZiAoc29mX29wcyhzZGV2KS0+
d3JpdGViKQotCQlzb2Zfb3BzKHNkZXYpLT53cml0ZWIoc2Rldiwgc2Rldi0+YmFyW2Jhcl0g
KyBvZmZzZXQsIHZhbHVlKTsKKwlpZiAoc29mX29wcyhzZGV2KS0+d3JpdGU4KQorCQlzb2Zf
b3BzKHNkZXYpLT53cml0ZTgoc2Rldiwgc2Rldi0+YmFyW2Jhcl0gKyBvZmZzZXQsIHZhbHVl
KTsKIAllbHNlCiAJCXdyaXRlYih2YWx1ZSwgIHNkZXYtPmJhcltiYXJdICsgb2Zmc2V0KTsK
IH0KQEAgLTMyOSwxMSArMzI5LDExIEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBzbmRfc29mX2Rz
cF93cml0ZTY0KHN0cnVjdCBzbmRfc29mX2RldiAqc2RldiwgdTMyIGJhciwKIAkJd3JpdGVx
KHZhbHVlLCBzZGV2LT5iYXJbYmFyXSArIG9mZnNldCk7CiB9CiAKLXN0YXRpYyBpbmxpbmUg
dTggc25kX3NvZl9kc3BfcmVhZGIoc3RydWN0IHNuZF9zb2ZfZGV2ICpzZGV2LCB1MzIgYmFy
LAorc3RhdGljIGlubGluZSB1OCBzbmRfc29mX2RzcF9yZWFkOChzdHJ1Y3Qgc25kX3NvZl9k
ZXYgKnNkZXYsIHUzMiBiYXIsCiAJCQkJICAgdTMyIG9mZnNldCkKIHsKLQlpZiAoc29mX29w
cyhzZGV2KS0+cmVhZGIpCi0JCXJldHVybiBzb2Zfb3BzKHNkZXYpLT5yZWFkYihzZGV2LCBz
ZGV2LT5iYXJbYmFyXSArIG9mZnNldCk7CisJaWYgKHNvZl9vcHMoc2RldiktPnJlYWQ4KQor
CQlyZXR1cm4gc29mX29wcyhzZGV2KS0+cmVhZDgoc2Rldiwgc2Rldi0+YmFyW2Jhcl0gKyBv
ZmZzZXQpOwogCWVsc2UKIAkJcmV0dXJuIHJlYWRiKHNkZXYtPmJhcltiYXJdICsgb2Zmc2V0
KTsKIH0KQEAgLTM2MSwxMCArMzYxLDEwIEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBzbmRfc29m
X2RzcF91cGRhdGViKHN0cnVjdCBzbmRfc29mX2RldiAqc2RldiwgdTMyIGJhciwKIHsKIAl1
OCByZWc7CiAKLQlyZWcgPSBzbmRfc29mX2RzcF9yZWFkYihzZGV2LCBiYXIsIG9mZnNldCk7
CisJcmVnID0gc25kX3NvZl9kc3BfcmVhZDgoc2RldiwgYmFyLCBvZmZzZXQpOwogCXJlZyAm
PSB+bWFzazsKIAlyZWcgfD0gdmFsdWU7Ci0Jc25kX3NvZl9kc3Bfd3JpdGViKHNkZXYsIGJh
ciwgb2Zmc2V0LCByZWcpOworCXNuZF9zb2ZfZHNwX3dyaXRlOChzZGV2LCBiYXIsIG9mZnNl
dCwgcmVnKTsKIH0KIAogLyogYmxvY2sgSU8gKi8KZGlmZiAtLWdpdCBhL3NvdW5kL3NvYy9z
b2Yvc29mLXByaXYuaCBiL3NvdW5kL3NvYy9zb2Yvc29mLXByaXYuaAppbmRleCBkM2VkZTk3
YjY3NTkuLmM2N2VjOWExMzk0YiAxMDA2NDQKLS0tIGEvc291bmQvc29jL3NvZi9zb2YtcHJp
di5oCisrKyBiL3NvdW5kL3NvYy9zb2Yvc29mLXByaXYuaApAQCAtMTcxLDkgKzE3MSw5IEBA
IHN0cnVjdCBzbmRfc29mX2RzcF9vcHMgewogCSAqIFRPRE86IGNvbnNpZGVyIHJlbW92aW5n
IHRoZXNlIG9wZXJhdGlvbnMgYW5kIGNhbGxpbmcgcmVzcGVjdGl2ZQogCSAqIGltcGxlbWVu
dGF0aW9ucyBkaXJlY3RseQogCSAqLwotCXZvaWQgKCp3cml0ZWIpKHN0cnVjdCBzbmRfc29m
X2RldiAqc29mX2Rldiwgdm9pZCBfX2lvbWVtICphZGRyLAorCXZvaWQgKCp3cml0ZTgpKHN0
cnVjdCBzbmRfc29mX2RldiAqc29mX2Rldiwgdm9pZCBfX2lvbWVtICphZGRyLAogCQkgICAg
ICAgdTggdmFsdWUpOyAvKiBvcHRpb25hbCAqLwotCXU4ICgqcmVhZGIpKHN0cnVjdCBzbmRf
c29mX2RldiAqc29mX2RldiwKKwl1OCAoKnJlYWQ4KShzdHJ1Y3Qgc25kX3NvZl9kZXYgKnNv
Zl9kZXYsCiAJCSAgICB2b2lkIF9faW9tZW0gKmFkZHIpOyAvKiBvcHRpb25hbCAqLwogCXZv
aWQgKCp3cml0ZSkoc3RydWN0IHNuZF9zb2ZfZGV2ICpzb2ZfZGV2LCB2b2lkIF9faW9tZW0g
KmFkZHIsCiAJCSAgICAgIHUzMiB2YWx1ZSk7IC8qIG9wdGlvbmFsICovCg==

--------------00y1iE8sMDyBdJ8uYcjX0kN8--
