Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B03356BEA29
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Mar 2023 14:35:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4D5BFF36;
	Fri, 17 Mar 2023 14:34:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4D5BFF36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679060132;
	bh=acAFgWVAW9Z16jtQyDLytLmE2NTyzAFRY8egGYSBlpA=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=d09yXAUS8qvUXGCpHEZAEIr9RZDSzC4WkO8rNP2I+0Vwfx6C3JSuZVjKyW22T3nO2
	 nVKpDfCEveTSR5bgAUzwIFYXzV/XN7qcyKxNZ5sr03XZpGZdIBj2YY5n1dQGvLXB9M
	 yaYDGcVuSC5vrULU1pBuUTz7RUx7MIaSnHn1d6kU=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A6210F8032D;
	Fri, 17 Mar 2023 14:34:41 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 99F77F80423; Fri, 17 Mar 2023 14:34:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 136FCF80272
	for <alsa-devel@alsa-project.org>; Fri, 17 Mar 2023 14:34:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 136FCF80272
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=henuGGhg
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id F2B72622A4;
	Fri, 17 Mar 2023 13:34:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0F1EC4339B;
	Fri, 17 Mar 2023 13:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679060067;
	bh=acAFgWVAW9Z16jtQyDLytLmE2NTyzAFRY8egGYSBlpA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=henuGGhglknoZ8qup/Rt9WTxF4ivkJWfsz2ImqjDbnJ92C2CgIQGjZrIUn/WKo4QI
	 DhZwVK+o0WyqaQ3i2G9eHS4dcAX7rbb8rk4XpomxiFyFAt8mB1OJ+HJgW2QgpFNTjx
	 hZoKtVrDEcpsH8BVSowgifyWvH/SHT+fc6slkV1EoWee56IQjCTQg8OXsAmev7VdNK
	 faESzw0kkHGJRbAHsFB9xpX5MxYVRdd1I3SdmUgH5GRtihWE+4O/KOv8l2tg33fz4r
	 +tGwJyEAwbpvxrjy3XyajTq9a6V9I4lFMX5gwzTofV8RKDNEltIF0LNG9nKr86Zexp
	 BYTI3SBRfNRDw==
Date: Fri, 17 Mar 2023 19:04:23 +0530
From: Vinod Koul <vkoul@kernel.org>
To: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
Subject: Re: [PATCH V6 2/8] soundwire: amd: Add support for AMD Manager driver
Message-ID: <ZBRsX7W4l1HyT44y@matsya>
References: <20230307133135.545952-1-Vijendar.Mukunda@amd.com>
 <20230307133135.545952-3-Vijendar.Mukunda@amd.com>
 <ZBGTDXJvVjVuUkiZ@matsya>
 <7a7f5d93-d6ec-5ad1-9927-7ac4b6d9a643@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7a7f5d93-d6ec-5ad1-9927-7ac4b6d9a643@amd.com>
Message-ID-Hash: E462GQHS3D4MIK3ZNZDWX6JZPJFIAFG6
X-Message-ID-Hash: E462GQHS3D4MIK3ZNZDWX6JZPJFIAFG6
X-MailFrom: vkoul@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 Basavaraj.Hiregoudar@amd.com, Sunil-kumar.Dommati@amd.com,
 Mario.Limonciello@amd.com, amadeuszx.slawinski@linux.intel.com,
 Mastan.Katragadda@amd.com, Arungopal.kondaveeti@amd.com,
 claudiu.beznea@microchip.com, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 open list <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/E462GQHS3D4MIK3ZNZDWX6JZPJFIAFG6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 16-03-23, 19:28, Mukunda,Vijendar wrote:
> On 15/03/23 15:12, Vinod Koul wrote:
> > On 07-03-23, 19:01, Vijendar Mukunda wrote:

> >> +/**
> >> + * struct amd_sdw_manager - amd manager driver context
> >> + * @bus: bus handle
> >> + * @dev: linux device
> >> + * @mmio: SoundWire registers mmio base
> >> + * @acp_mmio: acp registers mmio base
> >> + * @reg_mask: register mask structure per manager instance
> >> + * @probe_work: SoundWire manager probe workqueue
> >> + * @acp_sdw_lock: mutex to protect acp share register access
> >> + * @num_din_ports: number of input ports
> >> + * @num_dout_ports: number of output ports
> >> + * @cols_index: Column index in frame shape
> >> + * @rows_index: Rows index in frame shape
> >> + * @instance: SoundWire manager instance
> >> + * @quirks: SoundWire manager quirks
> >> + * @wake_en_mask: wake enable mask per SoundWire manager
> >> + * @power_mode_mask: flag interprets amd SoundWire manager power mode
> >> + */
> >> +struct amd_sdw_manager {
> >> +	struct sdw_bus bus;
> >> +	struct device *dev;
> >> +
> >> +	void __iomem *mmio;
> >> +	void __iomem *acp_mmio;
> >> +
> >> +	struct sdw_manager_reg_mask *reg_mask;
> >> +	struct work_struct probe_work;
> >> +	/* mutex to protect acp common register access */
> >> +	struct mutex *acp_sdw_lock;
> >> +
> >> +	int num_din_ports;
> >> +	int num_dout_ports;
> >> +
> >> +	int cols_index;
> >> +	int rows_index;
> >> +
> >> +	u32 instance;
> >> +	u32 quirks;
> >> +	u32 wake_en_mask;
> >> +	u32 power_mode_mask;
> >> +};
> > Does the manager need to be exposed to rest of kernel or users of this
> > driver, is so why?
> Currently, amd_manager structure being used in ACP PCI driver
> (parent driver) and Soundwire DMA driver.
> 
> In ACP PCI driver, IRQ handler we will use amd_manager structure to
> schedule workqueue based on soundwire manager instance.
> In Soundwire DMA driver, we need to retrieve amd_manager instance.
> As per our design, we have fixed mapping. We need to use same set of
> DMA registers based on CPU DAI ID.
>  i.e if AUDIO0 TX port is selected in amd_manager driver
> then we need to use AUDIO0 TX registers for DMA programming.
> we have included comments for describing mapping in amd_manager.h
> file.

Sorry not sure I follow, can you elaborate which members of above struct
are used by PCI driver?

-- 
~Vinod
