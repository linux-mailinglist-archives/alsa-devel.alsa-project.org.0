Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6888317986A
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Mar 2020 19:52:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ACB911661;
	Wed,  4 Mar 2020 19:51:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ACB911661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583347966;
	bh=CK7FYFnnJbr71WodcKJ4NDolBKg5LWo5kELipeS6MVw=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vNA1yxx5Hf3k1IxWKaRatfTy2tuE8h7vV6CknmOTIVf4uG5/hBmo/6zKY1ppzE6g9
	 f77Ordx0opIs7iM2M+jwgWhqncK6OkXVzfTP+4IwqfTmNy7BxgVKs603zKGyAjB3uD
	 5AIav/FZZ6rHimQkanTweFcPSvxxs4VEVimUibEc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BFF73F800D8;
	Wed,  4 Mar 2020 19:51:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B44A8F801ED; Wed,  4 Mar 2020 19:51:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_BLOCKED,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B3F63F8012D
 for <alsa-devel@alsa-project.org>; Wed,  4 Mar 2020 19:50:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B3F63F8012D
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Mar 2020 10:50:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,514,1574150400"; d="scan'208";a="229420960"
Received: from smhiray-mobl1.amr.corp.intel.com (HELO [10.252.140.1])
 ([10.252.140.1])
 by orsmga007.jf.intel.com with ESMTP; 04 Mar 2020 10:50:54 -0800
Subject: Re: 5.5.y - apply "ASoC: intel/skl/hda - export number of digital
 microphones via control components"
To: Mark Brown <broonie@kernel.org>
References: <147efa37-eb57-7f17-b9eb-84a9fe5ad475@perex.cz>
 <20200304154450.GB5646@sirena.org.uk>
 <a6d57c14-0794-77d0-5c6f-c0c897d254b5@perex.cz>
 <20200304160916.GC5646@sirena.org.uk>
 <44cf4ff8-120f-79fd-8801-47807b03f912@linux.intel.com>
 <20200304181113.GE5646@sirena.org.uk>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <669e6e57-3a84-7cf5-398f-eefdd333fadb@linux.intel.com>
Date: Wed, 4 Mar 2020 12:50:54 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200304181113.GE5646@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Sasha Levin <sashal@kernel.org>, Takashi Iwai <tiwai@suse.de>,
 ALSA development <alsa-devel@alsa-project.org>, stable@vger.kernel.org
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



> This thread is the first suggestion I've seen that this is any kind of
> bug fix.  There's no Fixes tag and the patch description itself sounds
> like it's adding a new feature to enable new functionality in userspace
> (autodetection by UCM) and it was posted as part of a series "ASoC: SOF:
> initial cleanup for DT and multi-client support" which again doesn't
> give any indication that this might be supposed to be a bug fix. 

the initial patch came from Jaroslav on 11/26, not from me. Quoting your 
own words:

"Since Pierre seems happy with it even if he didn't ack it explicitly
I'll guess I'll apply it.  If git can figure out applying it after the
merge window and it doesn't get negative reviews there's no need to
resend.  If it can't and it doesn't turn up in a bigger series before
then I'll let you know.
"

That patch was however not applied, that's the confusion I was referring 
to, and I included it in an SOF v2 series as agreed along with a rebase 
of the DT/multiclient support stuff to avoid conflicts between patchsets.





