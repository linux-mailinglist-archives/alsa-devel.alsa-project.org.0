Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 246CE2C2025
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Nov 2020 09:38:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BC692166D;
	Tue, 24 Nov 2020 09:37:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BC692166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606207123;
	bh=zmFOvpBWBa8RJeVEtCu1VAf3qwN3zra0rQq98dUkiK8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=srHe2iKQ/DR4HFc/H1q9Bjx3ToSOwim0UuWNGyKLtDi0Dahy9drXo6ngqjd9fDWn9
	 etlhvLPbvQx4G6sGXFiCBqquHwVPvd8teWOACPE4/aSoArraZ4eHuw6FMU+8tzGJuT
	 T1yge5S7She6Q98ErsMEsHJIR/UlPtPpwIG4kQ1M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4F0A7F80128;
	Tue, 24 Nov 2020 09:37:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8F731F80165; Tue, 24 Nov 2020 09:37:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B3513F800C1
 for <alsa-devel@alsa-project.org>; Tue, 24 Nov 2020 09:37:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B3513F800C1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ZAGnD/X0"
Received: from localhost (unknown [122.167.149.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D2D612073C;
 Tue, 24 Nov 2020 08:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606207018;
 bh=zmFOvpBWBa8RJeVEtCu1VAf3qwN3zra0rQq98dUkiK8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZAGnD/X0u+VvRE8js89J3P8AV9NeUR3LIZ/gmJsv0tjYB1vl09rvNMzh3E7eoxtlS
 qdjIJY8Fssz5hhqdVG6zTrXFjFTcJkDAuwIgoni9I8c05nazY+mgO/b9dkkdLP5dT7
 ghMPZgKu2OEuS1F3tY71BlyUX/s4my5YeSeQVJPY=
Date: Tue, 24 Nov 2020 14:06:54 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH 2/5] regmap/SoundWire: sdw: add support for SoundWire 1.2
 MBQ
Message-ID: <20201124083654.GI8403@vkoul-mobl>
References: <20201103172226.4278-1-yung-chuan.liao@linux.intel.com>
 <20201103172226.4278-3-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201103172226.4278-3-yung-chuan.liao@linux.intel.com>
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 tiwai@suse.de, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 ranjani.sridharan@linux.intel.com, hui.wang@canonical.com, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, mengdong.lin@intel.com,
 sanyog.r.kale@intel.com, rander.wang@linux.intel.com, bard.liao@intel.com
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

On 04-11-20, 01:22, Bard Liao wrote:
> From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> 
> The SoundWire 1.1 specification only allowed for reads and writes of
> bytes. The SoundWire 1.2 specification adds a new capability to
> transfer "Multi-Byte Quantities" (MBQ) across the bus. The transfers
> still happens one-byte-at-a-time, but the update is atomic.
> 
> For example when writing a 16-bit volume, the first byte transferred
> is only taken into account when the second byte is successfully
> transferred.
> 
> The mechanism is symmetrical for read and writes:
> - On a read, the address of the last byte to be read is modified by
> setting the MBQ bit
> - On a write, the address of all but the last byte to be written are
> modified by setting the MBQ bit. The address for the last byte relies
> on the MBQ bit being cleared.
> 
> The current definitions for MBQ-based controls in the SDCA draft
> standard are limited to 16 bits for volumes, so for now this is the
> only supported format. An update will be provided if and when support
> for 24-bit and 32-bit values is specified by the SDCA standard.
> 
> One possible objection is that this code could have been handled with
> regmap-sdw.c. However this is a new spec addition not handled by every
> SoundWire 1.1 and non-SDCA device, so there's no reason to load code
> that will never be used.
> 
> Also in practice it's extremely unlikely that CONFIG_REGMAP would not
> be selected with CONFIG_REGMAP_MBQ selected. However there's no
> functional dependency between the two modules so they can be selected
> separately.

Reviewed-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
