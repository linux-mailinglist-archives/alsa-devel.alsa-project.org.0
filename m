Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E49745315F8
	for <lists+alsa-devel@lfdr.de>; Mon, 23 May 2022 22:31:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8710E172C;
	Mon, 23 May 2022 22:30:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8710E172C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653337908;
	bh=/S5g6CeBCiWrn/Y3BAFUzJbyJ4GzWejS0+C/R5mQX4c=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UbsThDdaQUSgvmrdV3kdwip9uCmEjPyTBf23oe/SXF2ZYUkOxfP2NvDbswjT+Uj+9
	 1vcCnXNNYyx62ecqMQf+2CBm5roPkUpxIashWFG+0kviAWbQglpul3nVQklKN1wTEz
	 mmx5zsjxlhA/9X4DjPW6PAS9ACqMBhI7CiLNZnT0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 05AB7F8025E;
	Mon, 23 May 2022 22:30:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 03BE3F80236; Mon, 23 May 2022 22:30:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,PRX_BODY_32,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 26E37F800CB
 for <alsa-devel@alsa-project.org>; Mon, 23 May 2022 22:30:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 26E37F800CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="gGqe6YKL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653337842; x=1684873842;
 h=message-id:date:mime-version:subject:to:references:cc:
 from:in-reply-to:content-transfer-encoding;
 bh=/S5g6CeBCiWrn/Y3BAFUzJbyJ4GzWejS0+C/R5mQX4c=;
 b=gGqe6YKLQc/nQIrmMiDVbZ7pVnUqRMVhxPS+gm1ugPF5Q4vPFbzc2p6+
 YyvkcSyjZxQaUGQSKcUucxXWHHVS5KCumMvb6GI+hVGo1EajNt/eKfEy4
 TXhACV7adLhAHOYMMv4pYuwzYc0tGkVhqWRtSlDE12RkJ/0yATPiuCBOP
 GAswg84N1u9nPhV4PGP34Ni341TlOCNSw4UK9d3Qvfx7Xbkj+0OS3j7ZS
 mQvCv5Id62YX5sNKqMfEu1r6CHJjwdQKbXOuzefF8uLHVctCehKmPin0M
 sl1sUQQsThkQXGrkecWBw18q3/IrRBzTxNUtMEZr+mP1ld3xGXBU5rzOe A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10356"; a="255413426"
X-IronPort-AV: E=Sophos;i="5.91,246,1647327600"; d="scan'208";a="255413426"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2022 13:30:36 -0700
X-IronPort-AV: E=Sophos;i="5.91,246,1647327600"; d="scan'208";a="663608136"
Received: from unknown (HELO [10.209.23.69]) ([10.209.23.69])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2022 13:30:36 -0700
Message-ID: <3526166d-15ce-5260-200e-5c1650388956@linux.intel.com>
Date: Mon, 23 May 2022 15:30:35 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [PATCH] Enable SPDIF output on Intel Hades Canyon
Content-Language: en-US
To: Dag B <dag@bakke.com>, ALSA development <alsa-devel@alsa-project.org>
References: <5d5924ee-a52a-04f0-5080-2b8d91bce5ba@bakke.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <5d5924ee-a52a-04f0-5080-2b8d91bce5ba@bakke.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: Takashi Iwai <tiwai@suse.com>
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



On 5/23/22 15:20, Dag B wrote:
> Without the attached patch, the s/pdif output on the Hades Canyon NUC
> does not work.
> 
> "Well known" issue, less known fix. As far as I can tell, there is no
> risk of any averse side-effects. But a bonus fix is enabling on-wire
> headset microphone, by chaining the right 'model' choice for the hardware.
> 
> If I should Cc: someone directly for this patch to be picked up, please
> let me know.
> 
> 
> I have been running with this patch for half a year or so.
> 
> Patch passes checkpatch.pl
> 
> Patch is based on what 'cyber4o' posted on the insanelymac forum [1].
> All the glory to this person, any error is likely mine.

Thanks for the patch.

You would need a Signed-off-by tag for this patch, and CC: Takashi (added)

+	[ALC700_FIXUP_NUC_SPDIF] = {

Maybe use HC_NUC, there are multiple versions of those devices?

+		.type = HDA_FIXUP_FUNC,
+		.v.func = alc700_fixup_nuc_spdif,

alc700_fixup_hc_nuc_spdif ?

+		.chained = true,
+		.chain_id = ALC269_FIXUP_DELL1_MIC_NO_PRESENCE,

that chain_id doesn't seem quite right?


> 
> Some other users with issues: [2] [3]
> 
> 
> Dag Bakke
> 
> 
> [1]
> https://www.insanelymac.com/forum/topic/339291-guide-hac-mini-osx-mojave-on-intel-hades-canyon-nuc8i7hvknuc8i7hnk/page/8/
> 
> 
> 2] https://bbs.archlinux.org/viewtopic.php?id=270917
> 
> [3]
> https://www.reddit.com/r/intelnuc/comments/9ft9x8/any_linux_users_got_the_spdif_toslink_to_work_on/
> 
> 
> 
