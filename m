Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A029E2165F6
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jul 2020 07:46:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2DF31166E;
	Tue,  7 Jul 2020 07:45:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2DF31166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594100764;
	bh=f7eFFJOYGRK+fvYwlkiyPSD7sPYUCURDrgucWQCSQ1s=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ua1RDde8UDT7ARP3QypECIWm8xCc/5QRVT2WBe2t1MMfL00sOvDU2vHqDnSoYxzNg
	 jheJqHfJnNRKIBpqiYQnxAHKLy1mzOweAWrcB5eeZKDC+d2JjH/ZRRtbGxm4slvncn
	 bj52WhVm528GBNSm+P5IRfWyX7UifRfsRp7U1Exg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4C327F80257;
	Tue,  7 Jul 2020 07:44:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D440DF80216; Tue,  7 Jul 2020 07:44:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E5D65F800DF
 for <alsa-devel@alsa-project.org>; Tue,  7 Jul 2020 07:44:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E5D65F800DF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="LywVwyGX"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:
 Reply-To:Cc:Content-ID:Content-Description;
 bh=VZkOok0klgYFwIIGzlVgtaFmTD1Z+sQAb+yB5lFvhOw=; b=LywVwyGX/TJ2DZv2pe2/K08L5r
 MJDRPMQ6dPYqEoL75gE7NLMEC2Gk+iIYvxkj5BYB9ir7uaGoEI3KTdZTpUy2dK34VvxQ5IFnAkwfj
 Z53fC+wV1m6YnNgod2y063+J0kDfkvSfL/JwxNnlgomj7ITPpGPt+ZMG2WaX8F9AreLeNJrdSXecK
 C33ZP48O7t5qd6WBZhZZe6Ns+2Q9Rie0b8hfMh7t/uoX8Nx7NBckcI4Euv6qnOwbdA3LL2fhNu/Dg
 In2bIpTuJuOw3SGWeK3oz3vCTfaZLo+AtgrZSyUq4n4nu7vRqZyNWxQyd5eeNefJn6MixQuYJg1XN
 ttz4h/7A==;
Received: from [2601:1c0:6280:3f0:897c:6038:c71d:ecac]
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jsgOj-00019U-FU; Tue, 07 Jul 2020 05:44:06 +0000
Subject: Re: mmotm 2020-07-06-18-53 uploaded
 (sound/soc/amd/renoir/rn-pci-acp3x.c:)
To: Andrew Morton <akpm@linux-foundation.org>, broonie@kernel.org,
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-next@vger.kernel.org, mhocko@suse.cz,
 moderated for non-subscribers <alsa-devel@alsa-project.org>,
 sfr@canb.auug.org.au, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
References: <20200707015344.U9ep-OO5Z%akpm@linux-foundation.org>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <b54188c7-47b4-b7e4-2f74-6394320df5df@infradead.org>
Date: Mon, 6 Jul 2020 22:44:00 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200707015344.U9ep-OO5Z%akpm@linux-foundation.org>
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

On 7/6/20 6:53 PM, Andrew Morton wrote:
> The mm-of-the-moment snapshot 2020-07-06-18-53 has been uploaded to
> 
>    http://www.ozlabs.org/~akpm/mmotm/
> 
> mmotm-readme.txt says
> 
> README for mm-of-the-moment:
> 
> http://www.ozlabs.org/~akpm/mmotm/
> 
> This is a snapshot of my -mm patch queue.  Uploaded at random hopefully
> more than once a week.
> 
> You will need quilt to apply these patches to the latest Linus release (5.x
> or 5.x-rcY).  The series file is in broken-out.tar.gz and is duplicated in
> http://ozlabs.org/~akpm/mmotm/series
> 

on i386:

when CONFIG_ACPI is not set/enabled:

../sound/soc/amd/renoir/rn-pci-acp3x.c: In function ‘snd_rn_acp_probe’:
../sound/soc/amd/renoir/rn-pci-acp3x.c:222:9: error: implicit declaration of function ‘acpi_evaluate_integer’; did you mean ‘acpi_evaluate_object’? [-Werror=implicit-function-declaration]
   ret = acpi_evaluate_integer(handle, "_WOV", NULL, &dmic_status);
         ^~~~~~~~~~~~~~~~~~~~~
         acpi_evaluate_object



-- 
~Randy
Reported-by: Randy Dunlap <rdunlap@infradead.org>
