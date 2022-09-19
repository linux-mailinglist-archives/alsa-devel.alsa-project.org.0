Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 43A1F5BCAD2
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Sep 2022 13:33:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7D6DDE11;
	Mon, 19 Sep 2022 13:32:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7D6DDE11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663587204;
	bh=j7t2QfpQGuakX4dKZ4nypX7zf5T2IAXWzndNGFmY974=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TeFOIKYo3o44+V0UJZLJlwwO1IG61oQWzZ+TzFfQAsWv9HBecFlYe71Dho8vc/IPw
	 dwcoSbXEbnd4Jn+P0ZWuBnAH/K4ZS8Wxxqbzc4giYdI43BmPGgLmNL4VJSkB63aY17
	 zJUtUayI2NNxsf4+Q53D1nm+79PgK+TcTpzI7A24=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EDAA8F80134;
	Mon, 19 Sep 2022 13:32:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 298ACF8023A; Mon, 19 Sep 2022 13:32:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 035F9F80134
 for <alsa-devel@alsa-project.org>; Mon, 19 Sep 2022 13:32:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 035F9F80134
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="KQaLkti4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663587142; x=1695123142;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=j7t2QfpQGuakX4dKZ4nypX7zf5T2IAXWzndNGFmY974=;
 b=KQaLkti4mdI1RA1SRFXq9Np2CW+fNJPF4oaIxqVRJwgkoS7sBLcyUTmH
 me6A4tQJinJR2LpVNienBBmy2ybTloX+0TbpjjEg7cppXhQzcaisIgsoc
 aYZH21U/QiDwuI5mnY24BKGvjsfsl9Gt5KUszVfd0GmXtVuLfigSN67cS
 fqN6NKeuk59wyWNhrFQuDAmuLfwXMbw65qdmQuVnhOcXuqDLM3cmTkXDf
 3n88pE5szGKd3quWPyQR8p2v30/k4smMYlMIv5PRx0SYU0NpQ1tKA8xZU
 G7J2PJRvOSrmOdExcf8zGylugQIufKiRnKGdc48Esbgi8vczH8bgBwiKv g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10474"; a="325666824"
X-IronPort-AV: E=Sophos;i="5.93,327,1654585200"; d="scan'208";a="325666824"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2022 04:32:18 -0700
X-IronPort-AV: E=Sophos;i="5.93,327,1654585200"; d="scan'208";a="596053686"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2022 04:32:16 -0700
Date: Mon, 19 Sep 2022 14:33:02 +0300 (EEST)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@eliteleevi.tm.intel.com
To: Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH] ALSA: hda/hdmi: Fix the converter reuse for the silent
 stream
In-Reply-To: <20220913070216.3233974-1-perex@perex.cz>
Message-ID: <alpine.DEB.2.22.394.2209191430310.2722275@eliteleevi.tm.intel.com>
References: <20220913070216.3233974-1-perex@perex.cz>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: Takashi Iwai <tiwai@suse.de>,
 ALSA development <alsa-devel@alsa-project.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
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

Hi,

sorry for the late review (as Takashi already applied).

On Tue, 13 Sep 2022 09:02:16 +0200, Jaroslav Kysela wrote:
> When the user space pcm stream uses the silent stream converter,
> it is no longer allocated for the silent stream. Clear the appropriate
> flag in the hdmi_pcm_open() function. The silent stream setup may
> be applied in hdmi_pcm_close() (and the error path - open fcn) again.

Jaroslav, did you hit a real-life problem with a particular sequence? The 
converter allocation was done in a sticky fashion on purpose. The silent 
stream setup (clearing KAE and/or letting codec to power down) was only 
released if the receiver is disconnected from the system. I.e. no actions 
were done in PCM close (on purpose).

Now if there were issues, I wonder whether we should modify the pcm_close 
instead, and avoid some of the cleanup in this case, as a better fix.

I think your patch will create a new problem:
 - receiver A connected to CVT X
 - silent stream enabled for X
 - app opens a PCM, connected to A+X, silent stream disabled  
 - receiver A disconnected
 -> actions in silent_stream_disable() not run correctly for CVT X

Br, Kai
