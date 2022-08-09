Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 927B258DB0F
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Aug 2022 17:24:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8C3E03E;
	Tue,  9 Aug 2022 17:24:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8C3E03E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660058692;
	bh=DDTqDEz1Gwtvz8xuRpbhV4vEtOX0rcM77ObMu7zxIIU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AK9w/1oyLENJAXD2Jl1Znp1Orgz9oaE/ObLdUXVqwy/jQ3dUEgV4184WmRpg/N8dx
	 HlMSDrCrUr75na7ikGHrNvmVpiwxMw1OPpyDWzB+LUDvOZKh5tndzzQh1kZChgqftP
	 UIkqt4fyCszu95B80Oe6OzSSge3MxvXIQAHs3FOg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E8CFAF800E8;
	Tue,  9 Aug 2022 17:23:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5D5EAF8016C; Tue,  9 Aug 2022 17:23:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com
 [IPv6:2607:f8b0:4864:20::82a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 01D0BF8012A
 for <alsa-devel@alsa-project.org>; Tue,  9 Aug 2022 17:23:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 01D0BF8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="A2SxNph/"
Received: by mail-qt1-x82a.google.com with SMTP id e28so926008qts.1
 for <alsa-devel@alsa-project.org>; Tue, 09 Aug 2022 08:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=A5REIXPZhx2QvQynwWaByU5xDx6beRgsM1q7t3M3QIc=;
 b=A2SxNph/DNpdrT9d3hveZB91fLfSAP4PkBx0flA7BTnis9Ybo6vd5+lOioDg+TZ0Ri
 UQXG2pBoHeTKCKeD415ZXXB5GWUv7NxTfeZNIK9crwiLoYhbiKX+JToa4SGqgAXWIIJc
 g26La4rUgq/xtdJNAyy0KfalOqEaD5+d4Llx1bemL99Oqk+5WARcSBiZDEI0t+vXFF04
 jFDPS6JycPQH4FYLHi944/szEz5e5Sz73adaax9pmd/4AH9NYDw9PgbxO3i4T//u0t8/
 PZ1ZBAlmtXlQsjMITCrfaxckXef1/o+lKmNcU/N7gmO39+qBPOFN05XmP4w56jgPRU1o
 V3mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=A5REIXPZhx2QvQynwWaByU5xDx6beRgsM1q7t3M3QIc=;
 b=kMNVPVtpJEwsuQD2ISdQ5N+v2x/fRVZQxmODqgDocYg4wdmdDdkdlV6bOaYRHUAU9j
 xfynya8WSGu+KmKxJZFYzwlTMK8D+SGYv9rolbb7olAAoH3G/mLSWJYfM9ebhDIxccFN
 CQLqF75QnPdJU9FVkH5sWhhxiSvbL0b/JGkxLexI+bvFjIP767TyOvx+pBXwHtoGr/gY
 pPOqeW+X0Yxgj5Bu8L98gHndIJVSVQXQbHkczFtmoeihpeY868ugOTR7wB1jJh3Pi3JG
 g3cgFLl6RZ3kLEmgGWOQjC5KLq2zXtgc6M+OkivRbPC17y+6E07MO6RvyS1tadBx5NWM
 Bxig==
X-Gm-Message-State: ACgBeo0d294xuTkJ7vaXcve4FOFl8mPOFTRdajU5PCzAV7z5heHzxe9q
 jKPcZl84EUCIDB5f2oBp02PDKVMkLZSCNQmRWo0=
X-Google-Smtp-Source: AA6agR5loxxYmWvOgY8IXER/onlN3o9Ts+lZi/Bv9dxls1CXuWv+Mw2vX/HgD4wWr4V10pqteJ/VYouRIQsN8BxPWUM=
X-Received: by 2002:ac8:7f88:0:b0:342:e9dc:ee77 with SMTP id
 z8-20020ac87f88000000b00342e9dcee77mr14870523qtj.384.1660058623938; Tue, 09
 Aug 2022 08:23:43 -0700 (PDT)
MIME-Version: 1.0
References: <CAHp75VckU2ZraLJ-frjWXjUu9pFW+-XmWgTbYqUXOUNAD-1HGA@mail.gmail.com>
 <6c8e4104-2239-a188-649d-585f059cabdd@intel.com>
 <YsgjdKEtE7pMDTnZ@smile.fi.intel.com>
 <a73b3ec0-5abb-ddfd-414b-b9807f05413e@linux.intel.com>
 <CAHp75Vd4D0KF7ik+aMOwv-+bofWja_tDe4YUmihQBF+RiHZTmA@mail.gmail.com>
 <e2fe6351-f9ee-48eb-ad7f-280249f7f3f7@intel.com>
 <CAHp75VfvN-iJTpgg6JeKhOqJLhtYSieo7d7SOCBoUu-81FtSqg@mail.gmail.com>
 <c19ed4a6-6a96-b4a4-0f5a-7ca1dba925d1@intel.com>
 <YsnoH64cKCT7gndw@smile.fi.intel.com>
 <2c6a4a61-e6c8-0487-8d29-dc3fbb90bbe2@intel.com>
 <Ys2EFtNVL8ZALQ5Q@smile.fi.intel.com>
 <acbaf339-2fd9-5b19-06e8-62e66c324dc6@intel.com>
In-Reply-To: <acbaf339-2fd9-5b19-06e8-62e66c324dc6@intel.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 9 Aug 2022 17:23:06 +0200
Message-ID: <CAHp75VcVEEUYf2YZLVMby_v4fNpA0upAB+YkWwrPxqV9R+-YZQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] lib/string_helpers: Introduce strsplit_u32()
To: Cezary Rojewski <cezary.rojewski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Andy Shevchenko <andy@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Hans de Goede <hdegoede@redhat.com>,
 Mark Brown <broonie@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 amadeuszx.slawinski@linux.intel.com,
 =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
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

On Tue, Aug 9, 2022 at 11:55 AM Cezary Rojewski
<cezary.rojewski@intel.com> wrote:
> On 2022-07-12 4:24 PM, Andy Shevchenko wrote:

...

> I've spent some time analyzing possible utilization of _Generic() in
> context of get_options() but in my opinion get_range() complicates
> things enough that get_range() and get_option() would basically need a
> copy per type.

Thanks for keeping us updated.

> If Linux kernel guarantees that sizeof(int), sizeof(unsigned int),
> sizeof(s32) and sizeof(u32) are all equal (given the currently supported
> arch set), then indeed modifying get_options() may not be necessary.
> This plus shamelessly casting (u32 *) to (int *) of course.

I think as long as Linux kernel states that it requires (at least)
32-bit architecture to run, we are fine. I have heard of course about
a funny project of running Linux on 8-bit microcontrollers, but it's
such a fun niche, which by the way uses emulation without changing
actual 32-bit code, that I won't even talk about.

> What's left to do is the __user helper function. What I have in mind is:
>
> int tokenize_user_input(const char __user *from, size_t count, loff_t
> *ppos, int **tkns)
> {
>         int *ints, nints;
>         char *buf;
>         int ret;
>
>         buf = kmalloc(count + 1, GFP_KERNEL);
>         if (!buf)
>                 return -ENOMEM;
>
>         ret = simple_write_to_buffer(buf, count, ppos, from, count);
>         if (ret != count) {
>                 ret = (ret < 0) ? ret : -EIO;
>                 goto free_buf;
>         }
>
>         buf[count] = '\0';

I guess this may be simplified with memdup_user(). Otherwise it looks like that.

>         get_options(buf, 0, &nints);

(You don't use ppos here, so it's pointless to use
simple_write_to_buffer(), right? I have noticed this pattern in SOF
code, which might be simplified the same way as I suggested above)

>         if (!nints) {
>                 ret = -ENOENT;
>                 goto free_buf;
>         }
>
>         ints = kcalloc(nints + 1, sizeof(*ints), GFP_KERNEL);
>         if (!ints) {
>                 ret = -ENOMEM;
>                 goto free_buf;
>         }
>
>         get_options(buf, nints + 1, ints);
>         *tkns = ints;
>         ret = 0;
>
> free_buf:
>         kfree(buf);
>         return ret;
> }

...

> as a part of fs/libfs.c not lib/cmdline.c. Is such approach acceptable?

I think so.

-- 
With Best Regards,
Andy Shevchenko
