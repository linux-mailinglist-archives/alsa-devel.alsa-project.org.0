Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F429F2939
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Nov 2019 09:35:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E43211675;
	Thu,  7 Nov 2019 09:34:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E43211675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573115723;
	bh=0kscjWodoyu8RTr2uhupUVLBDtC5vtpx923iHoHPG6o=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=k97s2oeIuUdDosPMwJpYGrS6vOG4rfIgZSxyWrpVmpPMJdxGfQijcltUjsR3gvtUP
	 OfTAqKyPFP9lS0fg+KXNaXKT5f9vmFZI9tOQhdprV8uEPfU/bhfLXNohmeqxFACYVy
	 MADozGKyqywIBG1KN6hqTsG1JwXuD9vFaZHyyKZ4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 25CA0F80508;
	Thu,  7 Nov 2019 09:33:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5D3C3F8049B; Thu,  7 Nov 2019 09:33:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9328FF800F3
 for <alsa-devel@alsa-project.org>; Thu,  7 Nov 2019 09:33:32 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id A0E85A0040;
 Thu,  7 Nov 2019 09:33:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz A0E85A0040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1573115611; bh=ph/PA33Fnm1nZMx6txjjCk25dCtzXp85n6gSOYQ0+1M=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=ooR9tASGO93oKj7rVQ8Sz025LmqtepIFe4IsNxZu7NZ11V7CdcxJbQywK/kVJiBuB
 1I+qdsqFuoAI1HylqNp5XNtmCYKP8FmuQoNoRDQKHvz67Rk7luP/q0PDiAC3Y42R/b
 rr4AMriqlZQQSdJlStQfp1dUjGiOvHm47IVzwCDs=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Thu,  7 Nov 2019 09:33:27 +0100 (CET)
To: Takashi Iwai <tiwai@suse.de>
References: <6dcc3e0d-0df5-90cf-220f-59253d3b5c7c@perex.cz>
 <s5ho8xo89m1.wl-tiwai@suse.de>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <608ff861-9c2a-e498-3ec9-4fe09f2583e6@perex.cz>
Date: Thu, 7 Nov 2019 09:33:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <s5ho8xo89m1.wl-tiwai@suse.de>
Content-Language: en-US
Cc: ALSA development <alsa-devel@alsa-project.org>,
 Mark Brown <broonie@kernel.org>, Kai Vehmanen <kai.vehmanen@linux.intel.com>
Subject: Re: [alsa-devel] UCM extensions
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Dne 07. 11. 19 v 7:48 Takashi Iwai napsal(a):
> On Tue, 05 Nov 2019 20:36:28 +0100,
> Jaroslav Kysela wrote:
>>
>> Hi all,
>>
>> 	I make some internal ucm code cleanups in alsa-lib and added
>> three major extensions to allow more complex configurations which we
>> require for the SOF kernel driver.
>>
>> 	The first thing is the added substitution for the value strings:
>>
>> https://github.com/alsa-project/alsa-lib/commit/f1e637b285e8e04e6761248a070f58f3a8fde6fc
>>
>> 	The second thing is the If block:
>>
>> https://github.com/alsa-project/alsa-lib/commit/985715ce8148dc7ef62c8e3d8ce5a0c2ac51f8df
>>
>> 	The third thing is the card / hardware like specifier passed
>> as the ucm name to snd_use_case_mgr_open() to support multiple card
>> instances:
>>
>> https://github.com/alsa-project/alsa-lib/commit/60164fc5886cdc6ca55eeed0c2e3f751a7d2b2c0
>>
>> 	All those patches (with other cleanups) are in the ucm2 branch
>> on github for comments:
>>
>> https://github.com/alsa-project/alsa-lib/commits/ucm2
>>
>> 	The proposed SOF UCM config diff is here:
>>
>> https://github.com/alsa-project/alsa-ucm-conf/commit/723b6da881721488229154e923ed36413955a051
>> https://github.com/alsa-project/alsa-ucm-conf/commits/ucm2
>>
>> 	I added everything to keep the interface backward compatible,
>> so the current applications should not observe any different
>> behavior. The applications like pulseaudio should use the
>> 'hw:CARD_INDEX' specifier for the open call in the future and
>> snd_use_case_parse_ctl_elem_id() helper for the element control names.
> 
> The only concern with these extensions so far is the compatibility.
> Imagine that people run the new profile on the old parser, it'd break
> easily.
> 
> I think other scripts often installing on the versioned directory if
> incompatibilities are seen.  Can we do that for UCM as well?
> 
> Or course, once after UCM parser is changed to be future-ready and
> allow some syntax for possible future extensions, we can keep that
> version directory in future, too.

While we are going to separate UCM files from alsa-lib to alsa-ucm-conf we can 
define the new syntax change until the first version is released (I can put a 
notice to README).

Speaking for Fedora, we have dependancy 'alsa-lib package version' must be 
equal to 'alsa-ucm package version'. If users will do any changes on their 
own, they should know what they are doing.

Anyway, we should learn from this and I would propose to add add something 
like 'Syntax 2' to the main configuration file now. The new functions should 
be activated only according the version.

Unfortunately, the current parser will just show an error message like:

ALSA lib parser.c:1337:(parse_master_file) uknown master file field Syntax
ALSA lib parser.c:1337:(parse_master_file) uknown master file field If

But at least, users should be notified that there is a configuration mismatch.

Another possibility is to change the suffix for the master configuration file 
to accept the "Syntax" check for the another future update. But honestly, I 
don't like ".conf2" and ".v2.conf" looks not so nice, too.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
