Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 848CE56B9C3
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Jul 2022 14:36:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 268F01EA;
	Fri,  8 Jul 2022 14:35:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 268F01EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657283769;
	bh=LpsM40yNTvzC/+/AR/Y9n3n19fnGruuufFLvhk35Rbw=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KTI6ffBURaD2NWLUJqqRKv2BqJ/wuazf4bUuk2Ag6AOU/UVbKQb4V5nVgMBk2NQG4
	 0jbURJPKIPNVwXG0/oMA1tRbG2jAKXaUUKnsFL2uCy8vK4sD4XCHC6O09EmlzszB86
	 EuEG7vpyOolxSUHrWYJ43pM+NJZdIey/VZ+6EMMU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 91742F8025B;
	Fri,  8 Jul 2022 14:35:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1B926F80167; Fri,  8 Jul 2022 14:35:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 55867F80084
 for <alsa-devel@alsa-project.org>; Fri,  8 Jul 2022 14:34:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 55867F80084
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="GU6THN02"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657283701; x=1688819701;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=LpsM40yNTvzC/+/AR/Y9n3n19fnGruuufFLvhk35Rbw=;
 b=GU6THN02wIPwWi4t+GFE0lGSCu4n8Gah9wNEiu1c0e8LwIyvoVNe0Hb5
 DAbqehPYOdP3svaijLcyXJ/euYr5jrjO4brPmFUCtI39Ekp8p12r6A5G0
 0OTqIu5GjraCumU4Ah/c4v9wfSJd6CNZ1l+in/P2ryx47NJUnUREtxI2L
 D7TGFmfhVE0muygVGhM8yc8IL8gSjo3Mh9R7SJ9+WxNiNlE3xyCvj0y09
 HIMHL5OttLgTNEg6sO3GPOY0lBzWMbBFOsVAJ8Bxhndygme7eQw7BYMeB
 +tZSPJ9K/5Zz4gKCRADkJq6MBUPRDdMzjRfS7iENxLeRuetNKmufuHVVL A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10401"; a="348254671"
X-IronPort-AV: E=Sophos;i="5.92,255,1650956400"; d="scan'208";a="348254671"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2022 05:34:55 -0700
X-IronPort-AV: E=Sophos;i="5.92,255,1650956400"; d="scan'208";a="621200906"
Received: from hekner-mobl5.ger.corp.intel.com (HELO [10.249.254.151])
 ([10.249.254.151])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2022 05:34:51 -0700
Message-ID: <a73b3ec0-5abb-ddfd-414b-b9807f05413e@linux.intel.com>
Date: Fri, 8 Jul 2022 15:35:37 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.10.0
Subject: Re: [PATCH 1/2] lib/string_helpers: Introduce strsplit_u32()
Content-Language: en-US
To: Andy Shevchenko <andy.shevchenko@gmail.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>
References: <20220707091301.1282291-1-cezary.rojewski@intel.com>
 <CAHp75VceKBoxXVPP4dRYb8LQqHMMDHFp6-E2iuZ-h2RTK8PWQQ@mail.gmail.com>
 <e0c7d254-ace3-625c-cc83-52ca0b45e9fc@intel.com>
 <CAHp75VckU2ZraLJ-frjWXjUu9pFW+-XmWgTbYqUXOUNAD-1HGA@mail.gmail.com>
 <6c8e4104-2239-a188-649d-585f059cabdd@intel.com>
 <YsgjdKEtE7pMDTnZ@smile.fi.intel.com>
From: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <YsgjdKEtE7pMDTnZ@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Andy Shevchenko <andy@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Hans de Goede <hdegoede@redhat.com>,
 Mark Brown <broonie@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 amadeuszx.slawinski@linux.intel.com,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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



On 08/07/2022 15:30, Andy Shevchenko wrote:
> On Fri, Jul 08, 2022 at 02:13:14PM +0200, Cezary Rojewski wrote:
>> On 2022-07-08 1:46 PM, Andy Shevchenko wrote:
>>> On Fri, Jul 8, 2022 at 1:33 PM Cezary Rojewski
>>> <cezary.rojewski@intel.com> wrote:
> 
> ...
> 
>>>> When I'd written the very first version of this function many months
>>>> ago, get_options() looked as it does not fulfill our needs. It seems to
>>>> be true even today: caller needs to know the number of elements in an
>>>> array upfront.
>>>
>>> Have you read a kernel doc for it? It does return the number of
>>> elements at the first pass.
>>
>> Yes, I've checked several parts of it. Perhaps I did miss something but
>> simple_strtoull() doc reads: use kstrtox() instead.
> 
> Doc was fixed to make clearer that in some cases it's okay to use
> simple_strtox(). And this was exactly due to obfuscation code with this
> recommendation. Yes, in general one supposed to use kstrtox(), but it's
> not 100% obligatory.
> 
>> Thus the strsplit_u32()
>> makes use of kstrtox().
> 
> Yeah...
> 
>>>> Also, kstrtox() takes into account '0x' and modifies the
>>>> base accordingly if that's the case. simple_strtoull() looks as not
>>>> capable of doing the same thing.
>>>
>>> How come?! It does parse all known prefixes: 0x, 0, +, -.
>>
>> Hmm.. doc says that it stops at the first non-digit character. Will
>> re-check.
> 
> Yes, but under non-digit implies the standard prefixes of digits.
> simple_strtox() and kstrotox() use the very same function for prefixes.
> 
>>>> The goal is to be able to parse input such as:
>>>>
>>>> 0x1000003,0,0,0x1000004,0,0
>>>>
>>>> into a sequence of 6 uints, filling the *tkns and *num_tkns for the caller.
>>>
>>> Yes. Have you checked the test cases for get_options()?
> 
> (1)
> 
> ...
> 
>>>> avs-driver, which is also part of the ASoC framework has very similar
>>>> debug-interface. I believe there's no need to duplicate the functions -
>>>> move them to common code instead.
>>>
>>> Taking the above into account, please try to use get_options() and
>>> then tell me what's not working with it. If so, we will add test cases
>>> to get_options() and fix it.
>>
>> There is a difference:
>>
>> 	// get_options
>> 	int ints[5];
>>
>> 	s = get_options(str, ARRAY_SIZE(ints), ints);
>>
>> 	// strsplit_u32()
>> 	u32 *tkns, num_tkns;
>>
>> 	ret = strsplit_u32(str, delim, &tkns, &num_tkns);
>>
>> Nothing has been told upfront for in the second case.
> 
> It seems you are missing the (1). The code has checks for the case where you
> can do get number upfront, it would just require two passes, but it's nothing
> in comparison of heave realloc().
> 
>   unsigned int *tokens;
>   char *p;
>   int num;
> 
>   p = get_options(str, 0, &num);
>   if (num == 0)
> 	// No numbers in the string!
> 
>   tokens = kcalloc(num + 1, sizeof(*tokens), GFP_KERNEL);
>   if (!tokens)
> 	return -ENOMEM;
> 
>   p = get_oprions(str, num, &tokens);
>   if (*p)
> 	// String was parsed only partially!
> 	// assuming it's not a fatal error
> 
>   return tokens;
> 

This diff is tested and works:
diff --git a/sound/soc/sof/sof-client-probes.c b/sound/soc/sof/sof-client-probes.c
index 60e4250fac87..48d405f78a83 100644
--- a/sound/soc/sof/sof-client-probes.c
+++ b/sound/soc/sof/sof-client-probes.c
@@ -410,61 +410,11 @@ static const struct snd_compress_ops sof_probes_compressed_ops = {
 	.copy = sof_probes_compr_copy,
 };
 
-/**
- * strsplit_u32 - Split string into sequence of u32 tokens
- * @buf:	String to split into tokens.
- * @delim:	String containing delimiter characters.
- * @tkns:	Returned u32 sequence pointer.
- * @num_tkns:	Returned number of tokens obtained.
- */
-static int strsplit_u32(char *buf, const char *delim, u32 **tkns, size_t *num_tkns)
-{
-	char *s;
-	u32 *data, *tmp;
-	size_t count = 0;
-	size_t cap = 32;
-	int ret = 0;
-
-	*tkns = NULL;
-	*num_tkns = 0;
-	data = kcalloc(cap, sizeof(*data), GFP_KERNEL);
-	if (!data)
-		return -ENOMEM;
-
-	while ((s = strsep(&buf, delim)) != NULL) {
-		ret = kstrtouint(s, 0, data + count);
-		if (ret)
-			goto exit;
-		if (++count >= cap) {
-			cap *= 2;
-			tmp = krealloc(data, cap * sizeof(*data), GFP_KERNEL);
-			if (!tmp) {
-				ret = -ENOMEM;
-				goto exit;
-			}
-			data = tmp;
-		}
-	}
-
-	if (!count)
-		goto exit;
-	*tkns = kmemdup(data, count * sizeof(*data), GFP_KERNEL);
-	if (!(*tkns)) {
-		ret = -ENOMEM;
-		goto exit;
-	}
-	*num_tkns = count;
-
-exit:
-	kfree(data);
-	return ret;
-}
-
 static int tokenize_input(const char __user *from, size_t count,
 			  loff_t *ppos, u32 **tkns, size_t *num_tkns)
 {
+	int ret, nints, i, *ints;
 	char *buf;
-	int ret;
 
 	buf = kmalloc(count + 1, GFP_KERNEL);
 	if (!buf)
@@ -473,12 +423,36 @@ static int tokenize_input(const char __user *from, size_t count,
 	ret = simple_write_to_buffer(buf, count, ppos, from, count);
 	if (ret != count) {
 		ret = ret >= 0 ? -EIO : ret;
-		goto exit;
+		goto free_buf;
 	}
 
 	buf[count] = '\0';
-	ret = strsplit_u32(buf, ",", tkns, num_tkns);
-exit:
+	get_options(buf, 0, &nints);
+	if (!nints) {
+		ret = -ENOENT;
+		goto free_buf;
+	}
+
+	ints = kcalloc(nints + 1, sizeof(*ints), GFP_KERNEL);
+	if (!ints) {
+		ret = -ENOMEM;
+		goto free_buf;
+	}
+
+	*tkns = kcalloc(nints, sizeof(u32), GFP_KERNEL);
+	if (!(*tkns)) {
+		ret = -ENOMEM;
+		goto free_ints;
+	}
+
+	get_options(buf, nints + 1, ints);
+	*num_tkns = nints;
+	for (i = 0; i < nints; i++)
+		(*tkns)[i] = ints[i + 1];
+	
+free_ints:
+	kfree(ints);
+free_buf:
 	kfree(buf);
 	return ret;
 }

Could be made nicer with some brain work put to it, we need strict u32 within the IPC message for the array...

-- 
Péter
