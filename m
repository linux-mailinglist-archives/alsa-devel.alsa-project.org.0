Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C24A8FACB6
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Jun 2024 09:56:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C08D1DF8;
	Tue,  4 Jun 2024 09:56:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C08D1DF8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717487797;
	bh=dxxQOqEppx7Ss+3/yHWJmVBhwR0KThGNQpkJ6bD/wjU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gru4HBEinqF5+qXBUUCIvRUkCYD1UCfS39zmpcKg07sXuA1MF4kj+mblSN/MxnK6z
	 ymCImU/oI0Ut7KzlnaR8eXEi7oM4jkC6kfvNTFBQl4ovlHW1uwrebTX+caibeAKd35
	 mdsMhMDPu4zySreDMx4jwofk7FFp4lT35YNU19tM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B5407F80589; Tue,  4 Jun 2024 09:56:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0E905F805A0;
	Tue,  4 Jun 2024 09:56:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2EAF3F80496; Tue,  4 Jun 2024 09:55:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 80245F80088
	for <alsa-devel@alsa-project.org>; Tue,  4 Jun 2024 09:55:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 80245F80088
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=oXeYsUYv
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C74EA61210;
	Tue,  4 Jun 2024 07:55:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 782CBC2BBFC;
	Tue,  4 Jun 2024 07:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717487753;
	bh=dxxQOqEppx7Ss+3/yHWJmVBhwR0KThGNQpkJ6bD/wjU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oXeYsUYvVb44sEaPLppo/yOShAz9VCmRSlKkFuY9qvs6avo8raPDINO468vPlt/SV
	 owdhRSzKd7tEkNYLGjw2tx5jmsFu7gnvRg5PoF2OGIUekQVSJVQUA3WUKJYtNqx4FK
	 RMZxj7X438woqZZ20c+mCfUvClUcBhS97kFBYezOHbxqVaKeArJDzzBkmfHk81GNhO
	 Hq+8NqJhiGd3cQ/JaHoa6o9oZWZ8Cef9nZrPqfVrXAcztCSc+wn9RROHvbz2Nu2Cs7
	 aLwcWqQ+zlC0LDE4YwN0QMSAiT4/hgLScsuOLZmCyrwfY+LMJZMrbjAqht4ln4DUHK
	 r0R7WJ6QQiN0g==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1sEP1M-000000005UG-06Nb;
	Tue, 04 Jun 2024 09:55:52 +0200
Date: Tue, 4 Jun 2024 09:55:52 +0200
From: Johan Hovold <johan@kernel.org>
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Sanyog Kale <sanyog.r.kale@intel.com>, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soundwire: bus: suppress probe deferral errors
Message-ID: <Zl7IiAp11qP8ndLq@hovoldconsulting.com>
References: <20240603123127.30477-1-johan+linaro@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240603123127.30477-1-johan+linaro@kernel.org>
Message-ID-Hash: MGGBWJCYDJIX6KF7BLNUS4FCXTYMMW5Q
X-Message-ID-Hash: MGGBWJCYDJIX6KF7BLNUS4FCXTYMMW5Q
X-MailFrom: johan@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MGGBWJCYDJIX6KF7BLNUS4FCXTYMMW5Q/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Jun 03, 2024 at 02:31:27PM +0200, Johan Hovold wrote:
> Use dev_err_probe() to avoid logging errors on probe deferral:
> 
> 	wsa884x-codec sdw:4:0:0217:0204:00:0: Probe of wsa884x-codec failed: -517

The error message here should just be removed as it is already logged by
driver core and does not provide any additional information.

I've sent a v2 here:

	https://lore.kernel.org/lkml/20240604075213.20815-1-johan+linaro@kernel.org/

Johan
