Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B5BB530A344
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Feb 2021 09:28:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4FBA4177A;
	Mon,  1 Feb 2021 09:27:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4FBA4177A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612168109;
	bh=JJ5YYYPOXjNZcCA6V/DnC/BmPE3ayFG335S0q9zKmu0=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vRNKZIiMErD0qadHAfsT6HT1zOGoeTzfKp3/PiZpNIc8kz391lVLW2qDj0sDtMDpF
	 tOHHZCEJYmJzlmb4e1h3tS9S9CxyqmEcUGz4BX7EuUNbpt6xq30HM02Q2aCpuVGhzB
	 yqp6ivPd/eTdv4Z26dc2qADQYZ2qkqEJNENFrqe8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8CC66F80234;
	Mon,  1 Feb 2021 09:26:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 73A59F80224; Mon,  1 Feb 2021 09:26:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EEF3FF800E2
 for <alsa-devel@alsa-project.org>; Mon,  1 Feb 2021 09:26:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EEF3FF800E2
IronPort-SDR: 1TbyRsMwnIKGeMRJIpiDvYMLG35xdebZRxxlqTlrZ/HFoNwb3AaIjrLAemboq1y+iI4XoXIUZv
 5R2GM5X448VQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9881"; a="242169452"
X-IronPort-AV: E=Sophos;i="5.79,391,1602572400"; d="scan'208";a="242169452"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2021 00:26:43 -0800
IronPort-SDR: fAA3pQeOd4JosL2x/yKJXbQxifrJW4yplqhjwQO3AujyJFS4sp/S9jONc6xnT4utUXZ/iAX0cl
 YfbOt9guAESg==
X-IronPort-AV: E=Sophos;i="5.79,391,1602572400"; d="scan'208";a="390804592"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2021 00:26:42 -0800
Date: Mon, 1 Feb 2021 10:23:22 +0200 (EET)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@eliteleevi.tm.intel.com
To: Mert Can Demir <validatedev@gmail.com>
Subject: Re: jack doesn't detected plugged after suspend
In-Reply-To: <CAH4rLk2uUbyFEWuvfZ2AFim35NDOcAGL2tUD0KDfN7OeZu0Vnw@mail.gmail.com>
Message-ID: <alpine.DEB.2.22.394.2102010959560.864696@eliteleevi.tm.intel.com>
References: <CAH4rLk2uUbyFEWuvfZ2AFim35NDOcAGL2tUD0KDfN7OeZu0Vnw@mail.gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: alsa-devel@alsa-project.org
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

On Mon, 1 Feb 2021, Mert Can Demir wrote:

> https://gitlab.freedesktop.org/pulseaudio/pulseaudio/-/issues/1125#note_784979.
> The related outputs and logs are baked into the issue, and seems that the
> outputs tells that alsa driver did not reported jack as plugged after
> suspend.

codec seems to be ALC256 with snd-hda-intel, kernel 
5.10.10-200.fc33.x86_64.

Can you say when this started to happen? There has been some recent
patches in this area, and I wonder if this is a regression or something
related to specific system configuration.

Some recent patches that are already included in 5.10.10:

9fc149c3bce7bdbb94948a8e6bd025e3b3538603 ALSA: hda: Reinstate runtime_allow() for all hda controllers
f5dac54d9d93826a776dffc848df76746f7135bb ALSA: hda: Separate runtime and system suspend
a6e7d0a4bdb02a7a3ffe0b44aaa8842b7efdd056 ALSA: hda: fix jack detection with Realtek codecs when in D3

You could also try disable power_save and see whether that has an effect.
I.e. add to /etc/modprobe.d/alsa-debug.conf (or some other conf file):

options snd_hda_intel power_save=0

More troubleshooting tips at:
https://wiki.archlinux.org/index.php/Advanced_Linux_Sound_Architecture/Troubleshooting

Br, Kai
