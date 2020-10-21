Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ED62294FB0
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Oct 2020 17:14:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AEEA51785;
	Wed, 21 Oct 2020 17:14:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AEEA51785
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603293293;
	bh=Xaw1ZO66HhA2ZRvrOumriSUqHRgsfxV+Cw6pxrqk0aQ=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DshY6ASpDVmdJckVa7/VnKVUxTL3+M2ldr/uqwQxD/gP9YT2PrmNfHMs9qtiQgoeG
	 wmuwPPMc3dSk98EkI35THGqrhdvbdLHzbqotzEClI54l3SQi00uZ7PU6LTAY9nVql6
	 /9oRPDA5wOEH91CdcBJqC2/veP8dUqOibzQ1FulQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2A8BEF80253;
	Wed, 21 Oct 2020 17:13:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BD659F80264; Wed, 21 Oct 2020 17:13:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 68F95F8011C
 for <alsa-devel@alsa-project.org>; Wed, 21 Oct 2020 17:13:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 68F95F8011C
IronPort-SDR: YWUjkJyaFiVLC1MT0/vjfTn7BDFtMeMoOYByPgvA8hQ/BdUWP1C/Oix+r3kdo9vf4qjMj25hlH
 MXMDrdtl6lzg==
X-IronPort-AV: E=McAfee;i="6000,8403,9780"; a="229007893"
X-IronPort-AV: E=Sophos;i="5.77,401,1596524400"; d="scan'208";a="229007893"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2020 08:13:04 -0700
IronPort-SDR: l8kn3qqaFTp2bDSgFp3xuMSI24cjn8WvPRN48DK7FqkSHhdSBijKK1IpaI+U+9/zggmPjRSwyp
 ckd9o4EbaclQ==
X-IronPort-AV: E=Sophos;i="5.77,401,1596524400"; d="scan'208";a="533565360"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2020 08:13:03 -0700
Date: Wed, 21 Oct 2020 18:11:07 +0300 (EEST)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@eliteleevi.tm.intel.com
To: Mark Brown <broonie@kernel.org>
Subject: Re: [GIT PULL] ASoC updates for v5.10
In-Reply-To: <20201021122209.GC4497@sirena.org.uk>
Message-ID: <alpine.DEB.2.22.394.2010211719200.864696@eliteleevi.tm.intel.com>
References: <20201012130845.816462076C@mail.kernel.org>
 <a31e2b24-9ef4-c84f-a663-c2a44b0c8938@perex.cz>
 <20201012132857.GC4332@sirena.org.uk>
 <0cfec32c-c0b4-ddbc-6a23-f5b898966c48@perex.cz>
 <alpine.DEB.2.22.394.2010211150040.864696@eliteleevi.tm.intel.com>
 <20201021122209.GC4497@sirena.org.uk>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>
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

Hey,

On Wed, 21 Oct 2020, Mark Brown wrote:

> On Wed, Oct 21, 2020 at 12:26:22PM +0300, Kai Vehmanen wrote:
>> maybe bundling the warning suppression to the same patchset was not the 
>> best of ideas. Jaroslav is correct the warnings can unfortunately create 
> 
> No, and especially putting it at the end of the series - presumably it
> has dependencies on the rest of it?  You should always put fixes first
> in a series.

I hadn't realized the warning gets triggered so commonly when sending the 
series out, so it was just a bad call to have this in the same series with 
coding-style fixes only. The warning patch has no strict dependency to the 
others. I know series with no hard dependencies are frowned upon, so this 
a double-fault on my part.

I can send the fix patch separately and save the rest of the series for 
5.11 window.

Br, Kai
