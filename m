Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DEE1D220A8D
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Jul 2020 12:55:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 88AD31665;
	Wed, 15 Jul 2020 12:54:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 88AD31665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594810533;
	bh=YhJg7LCXMJDo+xs+Nhv3dElWWXcNnML7HVuuzL4+bso=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ThS3x2MgeAMNHzaAt1M8R9OhP7DcFd+qfacZ/WE/n6bO2jbLRrOQ+TJD0ROAQvSYM
	 OH+nmmv6cVVVcmPnKbZ0DxrSLoGIbcFOlknaoapIWAjUaDDE4mqNfegLhWT0wt/rS3
	 sWlOqPZMafTC72YkStmCTvnoNmTMBNqHAcjgRIO4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B97B2F80113;
	Wed, 15 Jul 2020 12:53:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CCFA6F8021D; Wed, 15 Jul 2020 12:52:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 249DAF80113
 for <alsa-devel@alsa-project.org>; Wed, 15 Jul 2020 12:52:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 249DAF80113
IronPort-SDR: 8Bj5kjHpIusPaMBBem72Qi6QygF/2rLMUG9tBG7NgfCm+L/ccNMDokB2b1WUXaoyTJwdBp995u
 mpSRbwEPqTQw==
X-IronPort-AV: E=McAfee;i="6000,8403,9682"; a="149116668"
X-IronPort-AV: E=Sophos;i="5.75,355,1589266800"; d="scan'208";a="149116668"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2020 03:52:43 -0700
IronPort-SDR: bBxRYqxkrcYDm6Kp9QuiPqpgOW8qQfhpOOxV5oIsa+igeu5+hXuG3/gDOBSnVWTp+b6hpJQ/jx
 vf9MOov2LukQ==
X-IronPort-AV: E=Sophos;i="5.75,355,1589266800"; d="scan'208";a="460025160"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2020 03:52:41 -0700
Date: Wed, 15 Jul 2020 13:52:05 +0300 (EEST)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@eliteleevi.tm.intel.com
To: Sasha Levin <sashal@kernel.org>
Subject: Re: [PATCH AUTOSEL 4.4 7/9] ALSA: hda/hdmi: fix failures at PCM open
 on Intel ICL and later
In-Reply-To: <20200714144024.4036118-7-sashal@kernel.org>
Message-ID: <alpine.DEB.2.22.394.2007151332320.3186@eliteleevi.tm.intel.com>
References: <20200714144024.4036118-1-sashal@kernel.org>
 <20200714144024.4036118-7-sashal@kernel.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Takashi Iwai <tiwai@suse.de>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
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

Hi Sasha,

On Tue, 14 Jul 2020, Sasha Levin wrote:

> From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
> 
> [ Upstream commit 56275036d8185f92eceac7479d48b858ee3dab84 ]
> 
> When HDMI PCM devices are opened in a specific order, with at least one
> HDMI/DP receiver connected, ALSA PCM open fails to -EBUSY on the
> connected monitor, on recent Intel platforms (ICL/JSL and newer). While

we don't have Ice Lake hardware support in the HDA HDMI codec driver in 
any 4.x stable trees (only in 5.1+), so this patch will not help on those 
and can be dropped.

Br, Kai
