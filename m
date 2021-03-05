Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E81732ED46
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Mar 2021 15:39:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C7B7917A6;
	Fri,  5 Mar 2021 15:38:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C7B7917A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614955147;
	bh=D0Kh0/Ep05+YKS5QdYDl0ZTvCgmrsubVWFNaOvvabcY=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eAW+yHD3CILf7pmV2Ihau9yd3yNIeGXJlq+UQZahvO5KtGEkH+VVv0MfS9MABy6Zt
	 RBOLE0Qu+gmSwiCIbyJNSoOXMRs3f3QO3gjBE9UByVcm6M+k/faZqsXlIPamDjQ8ye
	 0TVmCXfUnlItKFEaEkxwX1C1yXCMGClSG5I5IodI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1F35AF800F3;
	Fri,  5 Mar 2021 15:37:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9B857F8025E; Fri,  5 Mar 2021 15:37:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from z11.mailgun.us (z11.mailgun.us [104.130.96.11])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C90FEF800ED
 for <alsa-devel@alsa-project.org>; Fri,  5 Mar 2021 15:37:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C90FEF800ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
 header.i=@mg.codeaurora.org header.b="wmdwiww6"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1614955046; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=DXwLCqCTtywj0IsWP+x2DjjRSSv6yK2BQOEiffdK5Ww=;
 b=wmdwiww6HP5RezYyAay+lRomsmYTdA5Qu4UfN+bUqvvs3o2fUw4kr+kpoP8mZRuiwOWW88gX
 782jEdu58qEuWBxjJsFrvfM2CD7tVbQZPwJuqg5Il3uaFS5OWWNGI9gdeRlwGtkW6iQNyObA
 /TUhbEDDd4H/pRtSGN6krKMCuBc=
X-Mailgun-Sending-Ip: 104.130.96.11
X-Mailgun-Sid: WyI4ZmE2ZSIsICJhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 604242202a5e6d1bfa922d65 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 05 Mar 2021 14:37:20
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 713FAC43461; Fri,  5 Mar 2021 14:37:20 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: b_lkasam)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id E93A7C433CA;
 Fri,  5 Mar 2021 14:37:19 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Fri, 05 Mar 2021 20:07:19 +0530
From: b_lkasam@codeaurora.org
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH V1] Add debug print in soc-dapm
In-Reply-To: <20210305095943.GA4552@sirena.org.uk>
References: <1614927242-19251-1-git-send-email-lkasam@codeaurora.org>
 <20210305095943.GA4552@sirena.org.uk>
Message-ID: <3511da77c7cc3fa03837dbf9cb03b1c6@codeaurora.org>
X-Sender: b_lkasam@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Cc: Laxminath Kasam <lkasam@codeaurora.org>, alsa-devel@alsa-project.org,
 b_lkasam@codeaurora.org, tiwai@suse.com
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

On 2021-03-05 15:29, Mark Brown wrote:
> On Fri, Mar 05, 2021 at 12:24:02PM +0530, Laxminath Kasam wrote:
>> Add debug print useful for issue analysis in soc-dapm.
>> This print for dapm widgets useful for debugging to find
>> widgets powering up and down.
> 
> There's already fairly extensive tracepoints for DAPM - this seems to
> correspond to snd_soc_dapm_widget_power, though it's at the application
> time rather than the queue time so we could add another tracepoint for
> this if you like?  I can see that the separate tracepoint would be
> useful, I mostly use the regmap tracepoints for that purpose but not
> every widget has register I/O.  Tracepoints are less noisy for the
> system as a whole than tracing every DAPM operation in dmesg, that 
> tends
> to irritate other users if it's left in as standard.

Thanks Mark for the response. But this is not default err/info print and
only dynamic debug print which should not result in noise. In case of
customer OEMs/final product versions where less options of debugging,
dynamic dmesg logging is preferable provided faster and this print is 
used
to identify issues debug fastly sometimes.

--
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, 
Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative 
Project.

