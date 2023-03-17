Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D09216BEA37
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Mar 2023 14:37:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BD3ACF4E;
	Fri, 17 Mar 2023 14:36:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BD3ACF4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679060264;
	bh=YgG7M48NvWPG+IFwKYlrFn+aDHqVaEcxa+91zb5zoFY=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=u3aLourDraUS/aYaazU76+wTixqGgAb8+i84SDCF8SpFs7h+SIK1yp0I9ENh4w3sG
	 H4v9TH+1MWpS7EO0BhgfRNF+uSiHVU+RQifgngmI7D7bH7QKIPUFl8H9Py/rhnMJaT
	 pHWFGqLv7A+eh5ISoQDrksA4h8UexufeG4KAn29Q=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 62C97F8032D;
	Fri, 17 Mar 2023 14:36:54 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A6D51F80425; Fri, 17 Mar 2023 14:36:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 54B6CF8032D
	for <alsa-devel@alsa-project.org>; Fri, 17 Mar 2023 14:36:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 54B6CF8032D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=S+O7dUCR
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 3D5F3CE2021;
	Fri, 17 Mar 2023 13:36:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 237CAC433EF;
	Fri, 17 Mar 2023 13:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679060200;
	bh=YgG7M48NvWPG+IFwKYlrFn+aDHqVaEcxa+91zb5zoFY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S+O7dUCRCgL8N+k2Q7Dt5nePQ8LGHCHNdjxt9Mpn+l3tynShAX5zGFGm1wVcSkJ8S
	 WAl2fjYnDcqDDc8rwGTj6EtIMhVgfwVf6HTOxtn33ycfnKnu5jvf+4BO7NfIq0b7JL
	 41b8LCiCMzHNQdC+ZLm8jaBBJUjTaHUCGfGBRCXMiXhMEuAlQZdHUmsRe0YYTlET9z
	 kOB/7wfj/3c1ZVpdxUwfGTqHSfLQcn+EHbNm391sSZ8SFhNWZ+oS7N9MEuZRj5mgQU
	 x+A7lH3IoR1L96XkFdNP9AZ5RpK0RnK62CCV4diqjchhj04UbT6gDDan5RX+VwQHUx
	 MKnv4FdVOTFWQ==
Date: Fri, 17 Mar 2023 19:06:36 +0530
From: Vinod Koul <vkoul@kernel.org>
To: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
Subject: Re: [PATCH V6 5/8] soundwire: amd: add SoundWire manager interrupt
 handling
Message-ID: <ZBRs5LAXRQ2S1Htc@matsya>
References: <20230307133135.545952-1-Vijendar.Mukunda@amd.com>
 <20230307133135.545952-6-Vijendar.Mukunda@amd.com>
 <ZBGYubOYyu7E8ueo@matsya>
 <3aa704b0-1142-8afe-b0f1-28bd2a254cc2@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3aa704b0-1142-8afe-b0f1-28bd2a254cc2@amd.com>
Message-ID-Hash: RO7O6FHLABH564QRED5JJZUUZA62LOHC
X-Message-ID-Hash: RO7O6FHLABH564QRED5JJZUUZA62LOHC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RO7O6FHLABH564QRED5JJZUUZA62LOHC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 16-03-23, 22:34, Mukunda,Vijendar wrote:
> On 15/03/23 15:36, Vinod Koul wrote:
> > On 07-03-23, 19:01, Vijendar Mukunda wrote:

> >> +static void amd_sdw_update_slave_status_work(struct work_struct *work)
> >> +{
> >> +	struct amd_sdw_manager *amd_manager =
> >> +		container_of(work, struct amd_sdw_manager, amd_sdw_work);
> >> +	int retry_count = 0;
> >> +
> >> +	if (amd_manager->status[0] == SDW_SLAVE_ATTACHED) {
> >> +		acp_reg_writel(0, amd_manager->mmio + ACP_SW_STATE_CHANGE_STATUS_MASK_0TO7);
> >> +		acp_reg_writel(0, amd_manager->mmio + ACP_SW_STATE_CHANGE_STATUS_MASK_8TO11);
> >> +	}
> >> +
> >> +update_status:
> >> +	sdw_handle_slave_status(&amd_manager->bus, amd_manager->status);
> >> +	/*
> >> +	 * During the peripheral enumeration sequence, the SoundWire manager interrupts
> >> +	 * are masked. Once the device number programming is done for all peripherals,
> >> +	 * interrupts will be unmasked. Read the peripheral device status from ping command
> >> +	 * and process the response. This sequence will ensure all peripheral devices enumerated
> >> +	 * and initialized properly.
> >> +	 */
> >> +	if (amd_manager->status[0] == SDW_SLAVE_ATTACHED) {
> >> +		if (retry_count++ < SDW_MAX_DEVICES) {
> >> +			acp_reg_writel(AMD_SDW_IRQ_MASK_0TO7, amd_manager->mmio +
> >> +				       ACP_SW_STATE_CHANGE_STATUS_MASK_0TO7);
> >> +			acp_reg_writel(AMD_SDW_IRQ_MASK_8TO11,
> >> +				       amd_manager->mmio + ACP_SW_STATE_CHANGE_STATUS_MASK_8TO11);
> >> +			amd_sdw_read_and_process_ping_status(amd_manager);
> >> +			goto update_status;
> > goto are mostly used for error handling, i dont thing case here deserves
> > a goto, can you please change this...
> I agree. goto statements will be used mostly for error handling.
> But this is a different scenario. We have used goto statement to call sdw_handle_slave_status()
> from if statement to make sure all peripheral devices are enumerated and initialized properly.
> Please let us know if you are expecting code to be modified as mentioned below.
> 
> sdw_handle_slave_status(&amd_manager->bus, amd_manager->status);
> 
> if (amd_manager->status[0] == SDW_SLAVE_ATTACHED) {
> 	acp_reg_writel(AMD_SDW_IRQ_MASK_0TO7, amd_manager->mmio +
> 		       ACP_SW_STATE_CHANGE_STATUS_MASK_0TO7);
> 	acp_reg_writel(AMD_SDW_IRQ_MASK_8TO11,
> 		       amd_manager->mmio + ACP_SW_STATE_CHANGE_STATUS_MASK_8TO11);
> 	amd_sdw_read_and_process_ping_status(amd_manager);
> 	sdw_handle_slave_status(&amd_manager->bus, amd_manager->status);
> }
> 
> We have to check any race conditions occurs or not if we implement code as mentioned
> above.

what race are you talking about

> IMHO, it is still good to go with goto statement implementation.

Since you keep checking, essentially this seems to be a loop?

-- 
~Vinod
