Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F36365E8B1
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Jan 2023 11:15:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A936F103A0;
	Thu,  5 Jan 2023 11:14:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A936F103A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672913718;
	bh=53oTLCg9Wb0l9nYQ36/1Fpga2J5Fx9Ms7KKyX6kKDts=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=pyRGmEgQLDF75lCoi/93gkhp/h5ddn7I2PSYKgYSVnn4c7n65+iSV0NL8sswu1Bc+
	 x3NnX8pk/9AAWHRXmxk8bkg8d0JbL8UX1LXsIZ4WUt3fcl5ugwedV4aBrncAgefWa0
	 kXOty32I2vs5bXlmS8KlXrBbiMWXP0h6+7sRK6U8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 57114F8022B;
	Thu,  5 Jan 2023 11:14:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8E985F80238; Thu,  5 Jan 2023 11:14:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=5.0 tests=NICE_REPLY_A, RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de
 [80.237.130.52])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B08BBF80238
 for <alsa-devel@alsa-project.org>; Thu,  5 Jan 2023 11:14:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B08BBF80238
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
 by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 id 1pDNGI-0002dJ-4w; Thu, 05 Jan 2023 11:14:14 +0100
Message-ID: <b99d78df-8087-5a18-a6ea-b83bf1446092@leemhuis.info>
Date: Thu, 5 Jan 2023 11:14:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 1/2] ALSA: hda: cs35l41: Don't return -EINVAL from system
 suspend/resume
Content-Language: en-US, de-DE
To: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org
References: <20230105093531.16960-1-tiwai@suse.de>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <20230105093531.16960-1-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de; regressions@leemhuis.info; 1672913656;
 87cb386f; 
X-HE-SMSGID: 1pDNGI-0002dJ-4w
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Stefan Binding <sbinding@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Lucas Tanure <tanureal@opensource.cirrus.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 05.01.23 10:35, Takashi Iwai wrote:
> The recent commit to support the system suspend for CS35L41 caused a
> regression on the models with CS35L41_EXT_BOOST_NO_VSPK_SWITC boost
> type, as the suspend/resume callbacks just return -EINVAL.  This is
> eventually handled as a fatal error and blocks the whole system
> suspend/resume.
> 
> For avoiding the problem, this patch corrects the return code from
> cs35l41_system_suspend() and _resume() to 0, and replace dev_err()
> with dev_err_once() for stop spamming too much.
> 
> Fixes: 88672826e2a4 ("ALSA: hda: cs35l41: Support System Suspend")
> Cc: <stable@vger.kernel.org>

Thx for taking care of that.

> Link: https://lore.kernel.org/r/4262e3c4-6169-bbd2-e918-16b06f6994bc@protonmail.com

Lore says "Not found". I wonder if it was a private mail later send
again here:

https://lore.kernel.org/all/e6751ac2-34f3-d13f-13db-8174fade8308@pm.me/

Ciao, Thorsten
