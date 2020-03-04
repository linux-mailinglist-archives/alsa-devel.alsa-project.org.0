Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 72A61179912
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Mar 2020 20:32:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F2ADD1662;
	Wed,  4 Mar 2020 20:32:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F2ADD1662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583350378;
	bh=tfKqw5tdIoF+zj9m/baHdwmBtuyTahaZjigB0HKaPjg=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=f+97MJ+ekFq17AnY78UhrUFm9TDCbCr9FWjR3jMXPyIasBOqyfWOq/5cpV2WeZDRe
	 /koh0b7fKeYyn1H2s3X4niL3YExU7Fr+Lzw2XHaq/p9SYfiA87yzlhr4g7pFMuQw/A
	 bktf2ISdiPytUT0DMsWaMIAwOiVidLpW8bVsd6Ck=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E921CF800D8;
	Wed,  4 Mar 2020 20:31:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 64304F801ED; Wed,  4 Mar 2020 20:31:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BE7EDF800D8
 for <alsa-devel@alsa-project.org>; Wed,  4 Mar 2020 20:31:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BE7EDF800D8
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Mar 2020 11:31:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,514,1574150400"; d="scan'208";a="229433110"
Received: from smhiray-mobl1.amr.corp.intel.com (HELO [10.252.140.1])
 ([10.252.140.1])
 by orsmga007.jf.intel.com with ESMTP; 04 Mar 2020 11:31:00 -0800
Subject: Re: 5.5.y - apply "ASoC: intel/skl/hda - export number of digital
 microphones via control components"
To: Mark Brown <broonie@kernel.org>
References: <147efa37-eb57-7f17-b9eb-84a9fe5ad475@perex.cz>
 <20200304154450.GB5646@sirena.org.uk>
 <a6d57c14-0794-77d0-5c6f-c0c897d254b5@perex.cz>
 <20200304160916.GC5646@sirena.org.uk>
 <44cf4ff8-120f-79fd-8801-47807b03f912@linux.intel.com>
 <20200304181113.GE5646@sirena.org.uk>
 <669e6e57-3a84-7cf5-398f-eefdd333fadb@linux.intel.com>
 <20200304190620.GF5646@sirena.org.uk>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <3b00df9a-6b53-def7-4304-d9829de749c6@linux.intel.com>
Date: Wed, 4 Mar 2020 13:30:59 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200304190620.GF5646@sirena.org.uk>
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



On 3/4/20 1:06 PM, Mark Brown wrote:
> On Wed, Mar 04, 2020 at 12:50:54PM -0600, Pierre-Louis Bossart wrote:
> 
>>> This thread is the first suggestion I've seen that this is any kind of
>>> bug fix.  There's no Fixes tag and the patch description itself sounds
>>> like it's adding a new feature to enable new functionality in userspace
>>> (autodetection by UCM) and it was posted as part of a series "ASoC: SOF:
>>> initial cleanup for DT and multi-client support" which again doesn't
>>> give any indication that this might be supposed to be a bug fix.
> 
>> the initial patch came from Jaroslav on 11/26, not from me. Quoting your own
>> words:
> 
>> "Since Pierre seems happy with it even if he didn't ack it explicitly
>> I'll guess I'll apply it.  If git can figure out applying it after the
>> merge window and it doesn't get negative reviews there's no need to
>> resend.  If it can't and it doesn't turn up in a bigger series before
>> then I'll let you know.
>> "
> 
> Right, that's me saying I'll apply something that looks like normal
> development work after the merge window as with other normal development
> work (even Jaroslav's initial version was sent after the merge window
> opened), not that I'll apply it as a fix.  There's no hint in any of
> that thread or in your resend that this was anything other than a new
> feature, and indeed you were talking about wanting to integrate it with
> a series that you didn't want to see in v5.5.  Jaroslav mentioned not
> wanting to delay if it'd cause him to miss the merge window but didn't
> seem to complain when I said he'd missed it with his initial posting.

ok, I misunderstood your reply then. I thought you would provide it as 
an update for v5.5, thanks for the clarification

> Anyway, is my understanding correct that this is fixing a regression
> caused by switching the default to SOF?

This is fixing a regression on platforms that have digital microphones, 
where SOF is automatically selected by default. For platforms without 
DMICs, the legacy driver is still used and this patch has no effect.

