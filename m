Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA4A2773EE
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Sep 2020 16:29:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 42C5E17E8;
	Thu, 24 Sep 2020 16:28:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 42C5E17E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600957771;
	bh=uY3+iyYBox8s7Z39XGZsnEmbmyCjnzRSwdpGk0veWzI=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Uaow1qCmrYuaUbTuxm8DZg7VZfTTfS4Dfe8/IAmFVozhxZCB8mx2DKjik1Z9S2dLm
	 0KE2Q7u/x7a1FFUdIxARPy0dMBDJNsHrZluxXqn37LDYsD0nmmDlAchEGjVzui142p
	 RmwHJ2A7X1Fjv9WrU0rNMb+Tc5O8pz0FAP8rAHQQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 06758F800B4;
	Thu, 24 Sep 2020 16:28:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D5D35F80256; Thu, 24 Sep 2020 16:28:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0C3F5F8015F
 for <alsa-devel@alsa-project.org>; Thu, 24 Sep 2020 16:28:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0C3F5F8015F
IronPort-SDR: Q8lXGrO73K2hydWyyx6AQmleDyXdOxC59lMswqfbxPlFmokJtaULbTta6bNmytC0V3n+D7Riwk
 PHJRMhWYiWZw==
X-IronPort-AV: E=McAfee;i="6000,8403,9753"; a="160504244"
X-IronPort-AV: E=Sophos;i="5.77,298,1596524400"; d="scan'208";a="160504244"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2020 07:28:09 -0700
IronPort-SDR: ZBuiUzklK9kbVteGq8egxw2aEjZO0AJGFJlKdGZFdw2N6jV0GIeJG0WgMUkfR09FSrl4S1SzUx
 iFKL0VaDzHQg==
X-IronPort-AV: E=Sophos;i="5.77,298,1596524400"; d="scan'208";a="336000019"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2020 07:28:07 -0700
Date: Thu, 24 Sep 2020 17:26:34 +0300 (EEST)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@eliteleevi.tm.intel.com
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 0/5] ASoC: SOF: fix kcontrol size checks
In-Reply-To: <20200924113508.GD4754@sirena.org.uk>
Message-ID: <alpine.DEB.2.22.394.2009241724010.3186@eliteleevi.tm.intel.com>
References: <20200921110814.2910477-1-kai.vehmanen@linux.intel.com>
 <160073312817.6173.14263034136602358389.b4-ty@kernel.org>
 <alpine.DEB.2.22.394.2009240841280.3186@eliteleevi.tm.intel.com>
 <20200924105645.GA4754@sirena.org.uk>
 <alpine.DEB.2.22.394.2009241426320.3186@eliteleevi.tm.intel.com>
 <20200924113508.GD4754@sirena.org.uk>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, lgirdwood@gmail.com,
 ranjani.sridharan@linux.intel.com, daniel.baluta@nxp.com
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

On Thu, 24 Sep 2020, Mark Brown wrote:

> On Thu, Sep 24, 2020 at 02:30:23PM +0300, Kai Vehmanen wrote:
> > yes, the series was based on broonie/for-5.10 for sending, and I tested 
> > again and both of the dropped patches still apply on top of for-5.10. They 
>
> Well, that's the only thing I can think of - that git thought they
> didn't actaully have any changes in them when it tried to apply them.

ack. I'll resend them -- let's see if they go through the system this 
time. :) In any case these were just coding style updates, so not urgent 
in any case.

Br, Kai
