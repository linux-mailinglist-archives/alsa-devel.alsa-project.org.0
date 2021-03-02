Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A5D0932A1EC
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Mar 2021 15:14:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1A04A171C;
	Tue,  2 Mar 2021 15:13:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1A04A171C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614694462;
	bh=0yIHsrP7Pf1lWzEWCNqE5bm01WkkoH6g1zGHv0P04Mw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nwyygmJFDMy1Empo+toiDLLoXd/M6ZRPdV6VKtsQpO7v5FDoXjkfvfQw5uBsZ9NpV
	 9J/4wwPAIqZwKKIftfDl7TGtVGhcWrv6Ed2K2PsJbG4nu2MaJLp3uCdWqR4c82VPS9
	 UZ/BhJyLxe21SEX7y0DadPWJAh3e1LkOUrb3DeHo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7C872F80271;
	Tue,  2 Mar 2021 15:12:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7AD56F80269; Tue,  2 Mar 2021 15:12:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 76E48F8012D
 for <alsa-devel@alsa-project.org>; Tue,  2 Mar 2021 15:12:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 76E48F8012D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="f80mvGHt"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8304264F04;
 Tue,  2 Mar 2021 14:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614694361;
 bh=0yIHsrP7Pf1lWzEWCNqE5bm01WkkoH6g1zGHv0P04Mw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=f80mvGHtxHaS0EIn3WabeaCLJpvzq8asVA+tnG0kZv5wJ++AkIH1AQ5DjlIkcZEMH
 GmqLau6Uo0ens3duXmATpIdc2KMqUO/PWtWth4LtHEXXHP57ColTEwiAAHaTmnSaDx
 E73CHHGrg0maHW4dTPW534y3DeB3m9Q9zPQ2TTm47CHItPn91+VerZ7Lgb0ObKjKOO
 +sohav7dxOkc3yqNxCzzJVByBT1F+ZTR2WcyhOPvBc3MbneS863t2amxXlhCeS/swA
 mRVumqP+1kK3v6yZW5T+O4mRZ2hOmW4gyW8PYB97RrhSGhR1g/jr5sZzdGnvn6Iadh
 c2tyF4jzIpWPw==
Date: Tue, 2 Mar 2021 19:42:37 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 6/7] ALSA: hda: move Intel SoundWire ACPI scan to
 dedicated module
Message-ID: <YD5H1XdfKl10kcpe@vkoul-mobl>
References: <20210302003125.1178419-1-pierre-louis.bossart@linux.intel.com>
 <20210302003125.1178419-7-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210302003125.1178419-7-pierre-louis.bossart@linux.intel.com>
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 alsa-devel@alsa-project.org, arnd@arndb.de,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, tiwai@suse.de, broonie@kernel.org,
 Bard Liao <bard.liao@intel.com>
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

On 01-03-21, 18:31, Pierre-Louis Bossart wrote:
> The ACPI scan capabilities is called from the intel-dspconfig as well
> as the SOF/HDaudio drivers. This creates dependencies and randconfig issues
> when HDaudio and SOF/SoundWire are not all configured as modules.
> 
> To simplify Kconfig dependencies between HDAudio, SoundWire, SOF and
> intel-dspconfig, move the ACPI scan helpers to a dedicated
> module. This follows the same idea as NHLT helpers which are already
> handled as a dedicated module.
> 
> The only functional change is that the kernel parameter to filter
> links is now handled by a different module, but that was only provided
> for developers needing work-arounds for early BIOS releases.
> 
> Reported-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
> Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
> Reviewed-by: Bard Liao <bard.liao@intel.com>
> ---
>  drivers/soundwire/intel.h           |   2 -
>  drivers/soundwire/intel_init.c      | 158 -------------------------

Acked-By: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
