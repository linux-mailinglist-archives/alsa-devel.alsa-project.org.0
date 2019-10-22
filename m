Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D0EE00E8
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Oct 2019 11:41:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2E3EE1655;
	Tue, 22 Oct 2019 11:40:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2E3EE1655
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571737295;
	bh=aMb4o2nwzS+ks8DbxxT4QkA6bpHf/TlBzWq4c2tiWk0=;
	h=Date:From:To:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Reply-To:From;
	b=sVhCGFT3aMe0AqEHKo97DkkXtZlO0O4ougPxo3mBDo/i+5PJBKUKEkoqeI663a+wx
	 bfXPOb/uplDX1YS/JmmAPv5nsk/XdStH71Q/Qt72wEhrCMrnUe/EKsxe9FaPdBA0DZ
	 +7Rl4k+h61I4xlwtvkHSmQwXAV7YF6Q4x+i7mg5A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 69D0FF8031A;
	Tue, 22 Oct 2019 11:39:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 69484F8026A; Tue, 22 Oct 2019 11:39:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from sonic311-30.consmr.mail.ir2.yahoo.com
 (sonic311-30.consmr.mail.ir2.yahoo.com [77.238.176.162])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 61A92F8026A
 for <alsa-devel@alsa-project.org>; Tue, 22 Oct 2019 11:39:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 61A92F8026A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com
 header.b="Whui8d40"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1571737183; bh=RjlUY0pEi5uVxKp0oph7WUmwpi3zyzSjqaYyRAIrSyo=;
 h=Date:From:Reply-To:To:Cc:In-Reply-To:References:Subject:From:Subject;
 b=Whui8d40iofSaDGLS54Csz7CPlh3PCCFF7fahFQyEdsPtkzFq1VCfEChN0vSlF1kPTNJPacpiexYeN2T06mA7PoDSn/aly1VqhOnbDm0sFqu5j1QIa473wnBzHeD514t9A6XWwGWkYoKwfwSpJ/kvDMUgtYIAhcEQ8v46TfSJqgF4peO8gCcwEipvXnCCGrWpCEAh+JRSmo+VXCYAggt9sJNZvFFM+TjUsV5gsyCXCxruD0cjT1iVSG2SZ92b0CUvKZbDtaDTsC1x4wki+YXISeevswG1YU7lv8GrBme6dAS2ztOB37Vbu4kbpuCoGp1ziCBPNHgXi42ZRss8hzWtg==
X-YMail-OSG: ZxtvZM4VM1nhlN2_EOrzPqI6ZQ2K_kfvZpe0ee3N0px9rDCq6.2gOQFO97WwCM2
 aT3v1CG5utwqy85BXhcXaLtXtTnmQKqhvMN0Uu5YlDDex..J2YFAqjVPYSGa1Dx2y1aEPc0jZijc
 n.anV14VhsMg8hCl72_OF4ShAZG62QXadEZ1NR1RDya_PWz0BJB7_aLNQjNvWSeoNOkOj6IevHAq
 PKWdkAcCAIXFtgXdpkL99WUqoviKLRLktwsC6nBbVIiAdJgKDFhv.A3VkbobvxpmhgwFEto.OKFQ
 .HOAnROKgBXOpjZ5A347PmUgFYEMNi8K9nhFOdh.1lkEPbaMQQy4jmSalHxQ2kv1upq0gEm_9ZA1
 lwHNOw7YH5stz3XZGnp7EsjF43N21JGx8tMQwwcveCYLAZXgHOjv25tsjdj9IEsrwLXVqAxAmhWT
 chrbNpdQHt4TaIJDuf2aAPRVjD_vM2dWWWvUBem8kAaoLUfGNOQnCszLnef6unyLcWib2j8hSUAj
 hYkAGTwT3FLOZiBxie6POfI4.6O5BouAL5jbFmiPK6EdX82PRMqeitWzIpZ_c3pNACQFkiT7K2ic
 O5vjuE5thUvVR1rWwmE7ogEZgmOfi2Fp7IU__VdqCkeAwqbbyjHwfo2SP9a6qHeHxYCJQrQ8mfvT
 GKACxuEy_UZnM0fEEhCzHal7XvNrqvJzyNIHbNaMEXaTye3M_0J1gL7VC5cusXUqvn4A24uh2HFJ
 .pP_FmNNnr6p7j5OiEF_pLrBh8Gxe2vI0wZEKysMyeL1KYPIvMYNaBCPQH9r4jsIo69Up2YIBwAK
 UG5GiLujJrNRBCLF5K.LgtUY8JkOs3KrAPm1Ffio0kdu1PqP1AOoFEjFigZNUIwu8QAtyHNuUrXv
 ZgGAanyiDo4boGY302f0VVTxU1VjXzNEsLiJO1TwJAUsddMi4vh9NuZWWGpV5KNtftyDIRIjy8hA
 tQ.qx5uuZ1TN.U.f.Y8ysxcdJg0.TEsMVKDkqy.5Nr6iKmkdAmvPgh6rh2LWaEwcWnG_4Jn.sDJt
 ac5V98F8rUYAhJrBd1M_Hcpl1Yi3knAxe5CSBghSbxy5IpmQyGJ_8ZdbqxSlWSkypB0m8JxvkSsT
 RVN8ZQjltLA1ycRn1CO4vg1Kq3lBxoeZ5me4wDRZs0YBmPyj7CJcxMPxGF8q7h29c2CCFkHJJKwj
 QmRlDqxqVrdv_pClOXsaaxHXebzR15UjlurOtlqjjO.JoDMqCmF1TdLZuDjhWUmVsENqvnlPh2pi
 Df4Qc090mA5FGx6FJQK9woaC.BRSJXovP2mR7s9PdAezQ1mXW0C0sFcqjyCxF8S2ZAC3_KTT6msE
 8sF05.W8bD6mIh53HDi_fJIUVKS047MgjzpEc7JgE81vT2h.vv4BhdqoyfE48sery1aQsBkai453
 ePNRjZquRHRCL.TYTbRcDUo2zMQ--
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic311.consmr.mail.ir2.yahoo.com with HTTP; Tue, 22 Oct 2019 09:39:43 +0000
Date: Tue, 22 Oct 2019 09:39:41 +0000 (UTC)
From: Hin-Tak Leung <htl10@users.sourceforge.net>
To: Yu-Hsuan Hsu <yuhsuan@chromium.org>
Message-ID: <925340775.7968852.1571737181376@mail.yahoo.com>
In-Reply-To: <CAGvk5PoYYikRL90Vn2GxGWngwaaYzZwe6UX_hcjfAnLeBwvy=w@mail.gmail.com>
References: <2146461867.4835752.1571321696465@mail.yahoo.com>
 <CAEy1m_CXrhr15RZz_Q+TiMGj4DMBbUV8sCobmmkhguYJWCw03Q@mail.gmail.com>
 <572375501.5493214.1571396197926@mail.yahoo.com>
 <CAGvk5PrZ65wEp7y7UbtEN2CCf6c-wvoknMKyTmuqXY9EPg7jiw@mail.gmail.com>
 <43747502.7351282.1571666231987@mail.yahoo.com>
 <CAGvk5PoYYikRL90Vn2GxGWngwaaYzZwe6UX_hcjfAnLeBwvy=w@mail.gmail.com>
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] alsa conformance test fails to run for playback
 (and works for capture)
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
Reply-To: htl10@users.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

 

On Tuesday, 22 October 2019, 04:12:12 BST, Yu-Hsuan Hsu <yuhsuan@chromium.org> wrote:


> Hi Hin-Tak,

> I finally found out the reason! It is because there is a length limit
> of PCM name in ALSA conformance test.
> I have increased it on
> https://chromium-review.googlesource.com/c/chromiumos/platform/audiotest/+/1871792.
> Waiting for the review and merge.
> Thanks a lot for your catch!

> Best,
> Yu-Hsuan

Dear Yu-Hsuan,

Yes, I hand-applied the one-line change, and it now works. I do wonder if you should change the args_set_capture_dev_name() also? 
At the moment, MAX_DEVICE_NAME_LENGTH is only used in exactly one place, for the playback device name. Hence the surprise that
capture works but playback does not:

src/alsa_conformance_args.c-119-void args_set_playback_dev_name(struct alsa_conformance_args *args,
src/alsa_conformance_args.c-120- const char *name)
src/alsa_conformance_args.c-121-{
src/alsa_conformance_args.c-122- free(args->playback_dev_name);
src/alsa_conformance_args.c:123: args->playback_dev_name = strndup(name, MAX_DEVICE_NAME_LENGTH);
src/alsa_conformance_args.c-124-}
src/alsa_conformance_args.c-125-
src/alsa_conformance_args.c-126-void args_set_capture_dev_name(struct alsa_conformance_args *args,
src/alsa_conformance_args.c-127- const char *name)
src/alsa_conformance_args.c-128-{
src/alsa_conformance_args.c-129- free(args->capture_dev_name);
src/alsa_conformance_args.c-130- args->capture_dev_name = strdup(name);
src/alsa_conformance_args.c-131-}
src/alsa_conformance_args.c-132-

Regards,
Hin-Tak
  
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
