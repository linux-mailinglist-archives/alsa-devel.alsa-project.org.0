Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F0FF3E2B4A
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Aug 2021 15:26:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A0F4D16BE;
	Fri,  6 Aug 2021 15:25:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A0F4D16BE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628256386;
	bh=mZD3P/d/eVfRUvV5OGLAAL5dpyq2cxoDWPkmlORc8L4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=so815J1EHF0eCBZinMyt6OXyLFbG0rtCaYgPja2oqRApOzfdWD/59s7GSkE7LuWct
	 KOwtSO/djH0/aj5Nq430IXw7iZw+YLXPdBD6+STw1rPQTpn4G9u2s3rgEGUrXLhPkp
	 RamYISRxwtaazi1RtUpU7R1R6D2y0e9UuKqHFvt4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 093D5F80108;
	Fri,  6 Aug 2021 15:24:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C4145F8025F; Fri,  6 Aug 2021 15:24:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7701EF80169
 for <alsa-devel@alsa-project.org>; Fri,  6 Aug 2021 15:24:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7701EF80169
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="I/RqIADs"
Received: by mail.kernel.org (Postfix) with ESMTPSA id C34D3610CB;
 Fri,  6 Aug 2021 13:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628256288;
 bh=mZD3P/d/eVfRUvV5OGLAAL5dpyq2cxoDWPkmlORc8L4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=I/RqIADsjmkGi3pdYmcfthAxq+LbgZGkGMh2nktk0pFG+tsuMCDvOr2GygUIiJevt
 4QXzIXRktSgAlw3IxjAO4a1UawBRdcekmuZ6Illpgix7ev0Orje1uFL1XTDa5czGQi
 see+ZSmBlwatgq/KzUe37X41TG/DEar4GzQ3gZDXJOgFOq6c/4Z5rzSIqpqgkkb79h
 wVSikR9Cwdxxb9l0K3BAHbqw3Xzy3wX4pd4jbh9hbTr1QtXoPXqT030UrJdRNrc3Tr
 nI3yQug2jWStdUqTQ7JKZVrm3xO+8nd2emmmM4+3tqfQOanMrQBctiD4p+3E2YvYqj
 /eHHUU2vwOKTw==
Date: Fri, 6 Aug 2021 18:54:44 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 2/4] soundwire: intel: skip suspend/resume/wake when link
 was not started
Message-ID: <YQ04HOBucxNBXJkr@matsya>
References: <20210727055608.30247-1-yung-chuan.liao@linux.intel.com>
 <20210727055608.30247-3-yung-chuan.liao@linux.intel.com>
 <YQduUIXsoxlaDPsh@matsya>
 <18a695a4-08b8-ce72-9e5c-2f7b9812e8f9@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <18a695a4-08b8-ce72-9e5c-2f7b9812e8f9@linux.intel.com>
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, broonie@kernel.org,
 Bard Liao <yung-chuan.liao@linux.intel.com>, bard.liao@intel.com
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

On 02-08-21, 08:59, Pierre-Louis Bossart wrote:
> 
> 
> 
> >> On some HDaudio platforms, SoundWire devices are described in the
> >> DSDT but never used. This patch adds a boolean status flag to skip all
> >> suspend/resume/wake sequences for this configuration.
> > 
> > Why are the sdw devices created in this case then? I would assume you
> > are detecting this configuration and should skip device creation?
> 
> The SDW Linux devices are created during the probe step, based on
> information extracted from platform firmware. Since we see a matching
> driver, there will be a probe and that driver also contains pm ops.
> 
> We only know if the physical peripherals described in ACPI are real or
> not during the startup() phase. After the bus reset, SoundWire
> peripherals will report as ATTACHED as Device0 and the enumeration starts.
> 
> So in these HDaudio cases, we create the Linux devices based on
> incorrect ACPI information, but since we detect an HDaudio configuration
> we never start the links and the suspend-resume fails.
> 
> For a bit of historical context, the decision to handle devices in this
> way was not the original proposal from Intel. In the initial patches,
> the Linux devices were created when their matching physical peripheral
> was showing signs of activity and attached after synchronizing. We
> modified this behavior so that a device driver could use out-of-band
> signaling to power-up a peripheral so that it could attach. That wasn't
> a bad idea, but that also exposes a number of 'ghost devices' that are
> not real. And unfortunately the Intel BIOS reference keeps using those
> invalid _ADR values...
> 
> Does this answer to the question?

Yes it does thanks, very helpful.

Can we add this to the changelog, am sure down the line people might
forget why it was added.

-- 
~Vinod
