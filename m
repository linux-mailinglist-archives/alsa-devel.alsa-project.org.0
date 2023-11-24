Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 367607F6CA2
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Nov 2023 08:11:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BC43BA4D;
	Fri, 24 Nov 2023 08:11:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BC43BA4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700809882;
	bh=8oGVysG7zZuKUiOOlj+W5XkGwaErRlyqbLxjW9gwDgI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tZaBLlrnm5LL1QnNPwt3WEnToguaiCA5twag/87gIb/0GLNXlsxwWeEgm8Hjpy+SW
	 VBOfEbCCr5nzVKiM6FQndMpfxoWSLXyuEwWwv2trKwC6D7iQ1gvhFdEAV9F6m+voHF
	 eHqD4PnlC5Qx00LZLvqpMHeJEgM3CCqBs4Rlw2og=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 55382F8055B; Fri, 24 Nov 2023 08:10:50 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 07C02F80579;
	Fri, 24 Nov 2023 08:10:50 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B812AF80246; Fri, 24 Nov 2023 08:03:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2A19AF80246
	for <alsa-devel@alsa-project.org>; Fri, 24 Nov 2023 07:58:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2A19AF80246
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=TZiNHjP5
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 5FA5ACE0FF4;
	Fri, 24 Nov 2023 06:58:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE7C6C433C8;
	Fri, 24 Nov 2023 06:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700809123;
	bh=8oGVysG7zZuKUiOOlj+W5XkGwaErRlyqbLxjW9gwDgI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=TZiNHjP5ssXp5XzjwwL2tDf5kFi4FClHfHk6CtpdnfRN1hIYh7DaWwTlg/cO9EYhO
	 COlaM4KAdrsHUvCvzzlX6mKgVRr4n4xUwJn6njjhpB/0xwCTOh2gUCmGZWcBYoDaF0
	 LilvMfJHTiTQyS8pJjC3OQ47jWsj8JZ/aQyPtobwK00c3E189yDHmDR278fIOBpHth
	 LRHSkEEjvdZGQtZhJLGGJFi4BQ+s/jcmj7Rf13UAqm+0kxSDxni2lxExAEjEAudmwP
	 x2RyDg+dS7XE9is0AWdXOun4F0lHK0GxchlhIZ/5+2IFRbhAg7X7b3wOpCAJfMcR31
	 VAnWfaM4QuhZw==
From: Vinod Koul <vkoul@kernel.org>
To: alsa-devel@alsa-project.org, srinivas.kandagatla@linaro.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: tiwai@suse.de, broonie@kernel.org, gregkh@linuxfoundation.org,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Jaroslav Kysela <perex@perex.cz>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Philippe Ombredanne <pombredanne@nexb.com>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
In-Reply-To: <20231017160933.12624-1-pierre-louis.bossart@linux.intel.com>
References: <20231017160933.12624-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [RFC PATCH 0/2] soundwire: introduce controller ID
Message-Id: <170080911959.720753.6925948247080380570.b4-ty@kernel.org>
Date: Fri, 24 Nov 2023 12:28:39 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3
Message-ID-Hash: Q7YNE7R5ILWXTNAP4X65BAAK5XWNAUXP
X-Message-ID-Hash: Q7YNE7R5ILWXTNAP4X65BAAK5XWNAUXP
X-MailFrom: vkoul@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Q7YNE7R5ILWXTNAP4X65BAAK5XWNAUXP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Tue, 17 Oct 2023 11:09:31 -0500, Pierre-Louis Bossart wrote:
> This patchset is an alternate proposal to the solution suggested in
> [1], which breaks Intel machine drivers.
> 
> The only difference is to use a known controller ID instead of an IDA,
> which wouldn't work with the hard-coded device name.
> 
> This patchset was tested on Intel and AMD platforms, testing on
> Qualcomm platforms is required - hence the RFC status.
> 
> [...]

Applied, thanks!

[1/2] soundwire: bus: introduce controller_id
      commit: 6543ac13c623f906200dfd3f1c407d8d333b6995
[2/2] soundwire: fix initializing sysfs for same devices on different buses
      commit: 8a8a9ac8a4972ee69d3dd3d1ae43963ae39cee18

Best regards,
-- 
~Vinod


