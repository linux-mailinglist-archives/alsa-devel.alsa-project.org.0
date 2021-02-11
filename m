Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EB65E31886D
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Feb 2021 11:43:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 78DC916EE;
	Thu, 11 Feb 2021 11:42:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 78DC916EE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1613040218;
	bh=xKEXst7yNke3blx0NSoTP5V2gm+gvAkxk0VjuCWfpcU=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZPfc0lAt8m06euTNxuAjfUUrnO31gSiX1arrgpM6TdTyrKUPs7iduxS1Y+EyH3z3N
	 KBgJgdHpmydCMVq1em4R7B3t9UwMWIkTBQ9SedK8JxOsi6l9gFwB2eW+I2McexteRs
	 MM2X6odLxeaxRXT0yv9K+MJieLXlaw7WJkrPZ3bY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CBD55F8010D;
	Thu, 11 Feb 2021 11:42:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9FA01F801D5; Thu, 11 Feb 2021 11:42:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6FD89F80165
 for <alsa-devel@alsa-project.org>; Thu, 11 Feb 2021 11:41:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6FD89F80165
IronPort-SDR: IxHC3X+UKlq4bGKRbAW9SyeXv7nZ3+3cEXT2fl83djE5MNqii0vqtxdt6E1aC0ozbv0otxdze2
 pxBtCEd56WQw==
X-IronPort-AV: E=McAfee;i="6000,8403,9891"; a="179663633"
X-IronPort-AV: E=Sophos;i="5.81,170,1610438400"; d="scan'208";a="179663633"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2021 02:41:45 -0800
IronPort-SDR: lUeFT7GBocVUcol4Oj6iB1Qn++2CJ7GGkZ9L9COjoXOd3iV7PORLZGYoO1x38RFE4059uk2J4q
 vv3aOSnGoKIQ==
X-IronPort-AV: E=Sophos;i="5.81,170,1610438400"; d="scan'208";a="437073892"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2021 02:41:43 -0800
Date: Thu, 11 Feb 2021 12:38:16 +0200 (EET)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@eliteleevi.tm.intel.com
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH] ALSA: hda/hdmi: Drop bogus check at closing a stream
In-Reply-To: <20210211083139.29531-1-tiwai@suse.de>
Message-ID: <alpine.DEB.2.22.394.2102111236310.864696@eliteleevi.tm.intel.com>
References: <20210211083139.29531-1-tiwai@suse.de>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>
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

On Thu, 11 Feb 2021, Takashi Iwai wrote:

> Some users reported the kernel WARNING with stack traces from
> hdmi_pcm_close(), and it's the line checking the per_cvt->assigned
> flag.  This used to be a valid check in the past because the flag was
> turned on/off only at opening and closing a PCM stream.  Meanwhile,
> since the introduction of the silent-stream mode, this flag may be
> turned on/off at the monitor connection/disconnection time, which

ack, this needs to be removed:

Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>

Br, Kai

