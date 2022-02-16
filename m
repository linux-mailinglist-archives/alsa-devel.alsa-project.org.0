Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 816D64BA65A
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Feb 2022 17:48:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1CCED190E;
	Thu, 17 Feb 2022 17:47:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1CCED190E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645116486;
	bh=YUNeMwnffWU/vzA+11lFMuMWe0+JjFTHVyeqME5xzxw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CKKGg4G0JgPAI112/i/58zlXDQ+ttIow677PGUb0bWEhBFMoOQ+Z7CN71xmoEIgnt
	 dk+NLleVtnHbyBW/phaLqnQmEi+oXqsAI47rZyoxDv993bvHBXTIITB5hX8LXKUROg
	 q4yNgFq3Gmoo4AWjmI7xUwx1vosehdcNleXqcioY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 43CF7F80246;
	Thu, 17 Feb 2022 17:47:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B11EEF80128; Wed, 16 Feb 2022 23:42:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 65982F8011B
 for <alsa-devel@alsa-project.org>; Wed, 16 Feb 2022 23:42:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 65982F8011B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="RvhRgyEj"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 01E7BB81ED6;
 Wed, 16 Feb 2022 19:38:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28A69C004E1;
 Wed, 16 Feb 2022 19:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645040312;
 bh=YUNeMwnffWU/vzA+11lFMuMWe0+JjFTHVyeqME5xzxw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RvhRgyEjawXUAql0FqCTCcTpqR6GYBvsqNC9EZPqI5ZukTe3YMkyAiJ+1YKBf+Rlr
 sxewfhO7AtNd8GwQy/RQGGJ/AXgX1LgrWMnZTpDKZCiIl4MoI0X8P3b4yUkf4X3JeP
 l7bOM+By1/829q8HEUDp0joAEckiMlN1bSJeEtmm9DT0v1cg0aKN9haMO+KRTEXTKx
 BIawC1huC6S2hOqZ/gswPro0qF/Bzg0858Vu6QjTMbuvQTz7D1gR8uQt+HV6mEdhmv
 BV4TgmRvjAQDxRzfAaigAGsmsMmR8Yj0ESiy1ZrH3LP0qLNGtaqg4OazRGKQ9Qu6L7
 d13KOv1rLre5w==
Date: Wed, 16 Feb 2022 13:46:09 -0600
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH][next] treewide: Replace zero-length arrays with
 flexible-array members
Message-ID: <20220216194609.GA903947@embeddedor>
References: <20220215174743.GA878920@embeddedor>
 <202202151016.C0471D6E@keescook>
 <20220215192110.GA883653@embeddedor> <Ygv8wY75hNqS7zO6@unreal>
 <20220215193221.GA884407@embeddedor>
 <CAJZ5v0jpAnQk+Hub6ue6t712RW+W0YBjb_gAcZZbUeuYMGv7mg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJZ5v0jpAnQk+Hub6ue6t712RW+W0YBjb_gAcZZbUeuYMGv7mg@mail.gmail.com>
X-Mailman-Approved-At: Thu, 17 Feb 2022 17:46:58 +0100
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, linux-ia64@vger.kernel.org,
 Linux-sh list <linux-sh@vger.kernel.org>,
 nouveau <nouveau@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, target-devel@vger.kernel.org,
 linux-hardening@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-i3c@lists.infradead.org, linux-arch <linux-arch@vger.kernel.org>,
 linux-s390@vger.kernel.org, Leon Romanovsky <leon@kernel.org>,
 "open list:BLUETOOTH DRIVERS" <linux-bluetooth@vger.kernel.org>,
 linux-rdma@vger.kernel.org, linux-staging@lists.linux.dev,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
 Ext4 Developers List <linux-ext4@vger.kernel.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>, linux-xtensa@linux-xtensa.org,
 Kees Cook <keescook@chromium.org>, mpi3mr-linuxdrv.pdl@broadcom.com,
 coresight@lists.linaro.org, sparmaintainer@unisys.com,
 linux-um@lists.infradead.org, greybus-dev@lists.linaro.org,
 linux-rpi-kernel@lists.infradead.org,
 Linux OMAP Mailing List <linux-omap@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "open list:ACPI COMPONENT ARCHITECTURE \(ACPICA\)" <devel@acpica.org>,
 linux-cifs@vger.kernel.org,
 "open list:TARGET SUBSYSTEM" <linux-scsi@vger.kernel.org>,
 netdev <netdev@vger.kernel.org>, samba-technical@lists.samba.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-perf-users@vger.kernel.org, GR-QLogic-Storage-Upstream@marvell.com,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 linux-alpha@vger.kernel.org
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

On Wed, Feb 16, 2022 at 08:05:47PM +0100, Rafael J. Wysocki wrote:
> On Tue, Feb 15, 2022 at 8:24 PM Gustavo A. R. Silva
> <gustavoars@kernel.org> wrote:
> 
> Can you also send the ACPI patch separately, please?
> 
> We would like to route it through the upstream ACPICA code base.

Yeah; no problem.

Thanks
--
Gustavo
