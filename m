Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 43B6F515773
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Apr 2022 23:56:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B97E815E5;
	Fri, 29 Apr 2022 23:55:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B97E815E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651269393;
	bh=DfxjI8RkRMjkpatz3Z0pqRlYFjvYMxWMuRPuPuAAGxc=;
	h=Date:To:From:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=D8SQTlsCAsr5BIwKNUc+XzAMDM9y1Up0IGR6AgyUGv7F6P6BpjF52zICD/97WhHML
	 /TcqRTAWc4AbgOETy2v8l5bxRxYV306XBQlhBJZ5mGKZhL61Ga3/1SuN3PyASat7O/
	 tEgfPHwcrqXOABDqEJGWuKUYTpvB1jCq5Vnw5eIU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3A89FF80269;
	Fri, 29 Apr 2022 23:55:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6C5B6F8025D; Fri, 29 Apr 2022 23:55:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B02EBF8012B
 for <alsa-devel@alsa-project.org>; Fri, 29 Apr 2022 23:55:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B02EBF8012B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="OSGLide+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651269326; x=1682805326;
 h=message-id:date:mime-version:to:cc:from:subject:
 content-transfer-encoding;
 bh=DfxjI8RkRMjkpatz3Z0pqRlYFjvYMxWMuRPuPuAAGxc=;
 b=OSGLide+4lY+N7sDS6MTdZJpddA8UH84pCArF6OJuSLrtLSjKNMZyJhB
 69iJEzibimjbnb7taE89qVfq9iqmmo/xiUva1ATGrPiIBQFPWkIVRXKpO
 aN3U6RyIF9i2J0C6aiW3RVI8+lb9y1qt8AZkq7em1KWXWpYj48+K43RZE
 ZOQVMyhGkciIILJfGpAXGegKOrfA60wOzxpOnLkhumxowWDGicRNPAOi2
 cbFtsaJlvlgSRXRhJDzFrtPYWGRgAXOqhEBCB9+/QmFcTLqYz8BLJxokx
 PaTHh1pSgLXWiDnkqCNMM+15gej1RinLHxMSYScGDcDPmMxx81hxexU1Q A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10332"; a="254174844"
X-IronPort-AV: E=Sophos;i="5.91,186,1647327600"; d="scan'208";a="254174844"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2022 14:55:20 -0700
X-IronPort-AV: E=Sophos;i="5.91,186,1647327600"; d="scan'208";a="809324578"
Received: from mellis-mobl.amr.corp.intel.com (HELO [10.212.234.24])
 ([10.212.234.24])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2022 14:55:19 -0700
Message-ID: <d9c3fed4-de6a-2cd8-acb6-7f3d2ad46b70@linux.intel.com>
Date: Fri, 29 Apr 2022 16:55:18 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Content-Language: en-US
To: ALSA Development Mailing List <alsa-devel@alsa-project.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: ASoC component/card relationship
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Curtis Malainey <cujomalainey@google.com>,
 =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>,
 =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?= <amadeuszx.slawinski@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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
In the existing ASoC code, there is a fixed mapping between ASoC card and component. A component relies on a ->card pointer that is set during the probe. A component cannot be used by or "bound to" more than one card [1]

This has interesting impacts on how a codec or DSP driver need to be implemented.

In the AVS series posted this week, multiple components are registered by the DSP driver, following an interface-based split. There's in addition a second-level split, where the logic is pushed further: the DSP driver partitions the SSP DAIs in different set of 'dai_driver's used by different components, which are in turn used by different cards. What is done in these patches is not wrong, and is probably the only solution to support a real-world platform with the existing ASoC code, but are the framework assumptions correct? In this example, the board-level information on which interface is used for what functionality trickles down to the lowest level of the DSP driver implementation.

I believe this breaks to some extent the 'clean' split between platform and machine driver(s), and it's not quite aligned with the usual notion of register/probe used across frameworks, be it for drivers/clocks/you name it.

A similar case could happen in a codec driver, if independent functionality such as headset and amplifier support was exposed by separate cards, that would in turn mandate that the codec driver exposed N components, each handling different functionality but the same type of DAI.

An alternative approach would be that the DSP driver exposes all the possible DAIs that can be used, and the binding is refined to allow for more flexibility. I think it's really the individual DAI that cannot be used by more than one card.

I figured I would ask on this mailing list if

a) I am not mistaken on the component/card relationship and

b) if this is by design, or if we want to clarify what a component is and what its restrictions might be.

Thanks for your feedback/comments
-Pierre

[1] https://elixir.bootlin.com/linux/latest/source/sound/soc/soc-core.c#L1364
