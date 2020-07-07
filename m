Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0069A21663B
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jul 2020 08:10:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7C0E61678;
	Tue,  7 Jul 2020 08:09:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7C0E61678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594102207;
	bh=fcOIQO5Zxn2LPIddrHQEd1e60wow43uUASOlf8/p31I=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=B4GTrFFJUHXbCopktDApakY7yZrnKVsAJxw989CXRTRfGndN7wywPSAgMe6UI7JbI
	 TAcByPjzwWTLILdV3ZBV1K/3KAQwQxvgi2r1GwgVHfZCislCgIsf3Q3+LU5LgP9jto
	 CvDxy0eJ4P0XfNqVb2WtLFXPTPJJ9+rkLtJ+r07c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A0B33F80216;
	Tue,  7 Jul 2020 08:08:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A7B9FF80216; Tue,  7 Jul 2020 08:08:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E9258F8011F
 for <alsa-devel@alsa-project.org>; Tue,  7 Jul 2020 08:08:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E9258F8011F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="r0Clmfh9"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:
 Reply-To:Cc:Content-ID:Content-Description;
 bh=4V3LkIihmEZz3pvewklN8v/f9kZ9j33J/E7C/lspkG8=; b=r0Clmfh9v/3OeSVIQubt0lsQon
 UpFGA9ZtewIAQHj2FcjHABfZIdrkagS/kxm1q9V9mNq+Kd/JBgOvnafkB4pub//wJsRikLguL/GYR
 leMZ853pwE+0hJU+xci2JXdigkrGfBDdLt6qJIa5QqwM4cfoZJxOHF0oZcyE0TD5wT2Bo1XntGHB5
 JDuLCk0wh3ZBakBmyEQd+qiIuR/CAGa2NRmNKVKVE7006jvzXWrxdMH4I5MIO7WqJAka5EyxC24uI
 cC6WA0k7bZcHfwtYYlUhX99BcA8G5RAkjtn32j4Zwe+0v0VPhFy1MmPjLqASex3BilHFxs/6ub8wa
 jlk78dKw==;
Received: from [2601:1c0:6280:3f0:897c:6038:c71d:ecac]
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jsgm5-00029p-EC; Tue, 07 Jul 2020 06:08:14 +0000
Subject: Re: mmotm 2020-07-06-18-53 uploaded
 (sound/soc/amd/renoir/rn-pci-acp3x.c:)
To: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>, broonie@kernel.org,
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-next@vger.kernel.org, mhocko@suse.cz,
 moderated for non-subscribers <alsa-devel@alsa-project.org>,
 sfr@canb.auug.org.au
References: <20200707015344.U9ep-OO5Z%akpm@linux-foundation.org>
 <b54188c7-47b4-b7e4-2f74-6394320df5df@infradead.org>
 <e19cd74c-df3d-9589-1fc1-55980a8d289b@amd.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <2af9510e-b3fd-97d8-c2d4-1c42943180ee@infradead.org>
Date: Mon, 6 Jul 2020 23:08:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <e19cd74c-df3d-9589-1fc1-55980a8d289b@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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

On 7/6/20 11:15 PM, Mukunda,Vijendar wrote:
> 
> 
> On 07/07/20 11:14 am, Randy Dunlap wrote:
>> On 7/6/20 6:53 PM, Andrew Morton wrote:
>>> The mm-of-the-moment snapshot 2020-07-06-18-53 has been uploaded to
>>>
>>>     https://nam11.safelinks.protection.outlook.com/?url=http:%2F%2Fwww.ozlabs.org%2F~akpm%2Fmmotm%2F&amp;data=02%7C01%7CVijendar.Mukunda%40amd.com%7C34f06090b5394f9ccb9d08d82238c5cf%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637296974530250787&amp;sdata=K8z5g9P5S7Ct%2BojnITdP0xuz159sYOiDWOyUy3abDpo%3D&amp;reserved=0
>>>
>>> mmotm-readme.txt says
>>>
>>> README for mm-of-the-moment:
>>>
>>> https://nam11.safelinks.protection.outlook.com/?url=http:%2F%2Fwww.ozlabs.org%2F~akpm%2Fmmotm%2F&amp;data=02%7C01%7CVijendar.Mukunda%40amd.com%7C34f06090b5394f9ccb9d08d82238c5cf%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637296974530250787&amp;sdata=K8z5g9P5S7Ct%2BojnITdP0xuz159sYOiDWOyUy3abDpo%3D&amp;reserved=0
>>>
>>> This is a snapshot of my -mm patch queue.  Uploaded at random hopefully
>>> more than once a week.
>>>
>>> You will need quilt to apply these patches to the latest Linus release (5.x
>>> or 5.x-rcY).  The series file is in broken-out.tar.gz and is duplicated in
>>> https://nam11.safelinks.protection.outlook.com/?url=http:%2F%2Fozlabs.org%2F~akpm%2Fmmotm%2Fseries&amp;data=02%7C01%7CVijendar.Mukunda%40amd.com%7C34f06090b5394f9ccb9d08d82238c5cf%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637296974530250787&amp;sdata=6CpbYkoZTJ%2FxqhyFKdZMjH%2BdG5kjOgogt8KqqNK%2BzSI%3D&amp;reserved=0
>>>
>>
>> on i386:
>>
>> when CONFIG_ACPI is not set/enabled:
>>
>> ../sound/soc/amd/renoir/rn-pci-acp3x.c: In function ‘snd_rn_acp_probe’:
>> ../sound/soc/amd/renoir/rn-pci-acp3x.c:222:9: error: implicit declaration of function ‘acpi_evaluate_integer’; did you mean ‘acpi_evaluate_object’? [-Werror=implicit-function-declaration]
>>     ret = acpi_evaluate_integer(handle, "_WOV", NULL, &dmic_status);
> Will add ACPI as dependency in Kconfig for Renoir ACP driver.
> Do i need to upload new version of the patch? or should i submit the incremental patch as a fix >>           ^~~~~~~~~~~~~~~~~~~~~
>>           acpi_evaluate_object

Hi,
Not my call, but I would go with an incremental patch.


thanks.
-- 
~Randy

