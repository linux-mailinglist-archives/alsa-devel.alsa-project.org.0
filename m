Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AF0D62FB9D1
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Jan 2021 15:53:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C83AA1893;
	Tue, 19 Jan 2021 15:52:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C83AA1893
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611068021;
	bh=rw/mxQTxKjzM1IS9HMGj4yUmYRQZgEBUAvLh9y86vqk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AXRJpquIk4/i7iHN5sXeKlM2c4+p/6YW1fPj2UZyNZR+s2PfiQ0IqumiKZrigZ0OB
	 w+73VFN6HbR2SM7TGtDKUcV8QArgzYxBaCHPwlOWjnFB8VbtwHffTEcKo56mtoi5fW
	 WXtxCrLRZJ2IBuhj1Q0bfFO5R8OGLNWI1N10Tya8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C3E57F804CA;
	Tue, 19 Jan 2021 15:52:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6837CF804C3; Tue, 19 Jan 2021 15:52:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D1D0EF802BE
 for <alsa-devel@alsa-project.org>; Tue, 19 Jan 2021 15:52:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D1D0EF802BE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="K74/TcaN"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 51FD220DD4;
 Tue, 19 Jan 2021 14:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611067946;
 bh=rw/mxQTxKjzM1IS9HMGj4yUmYRQZgEBUAvLh9y86vqk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=K74/TcaNS0ofDl+B4nzdtA6Wp4i05o78R3yak6X+99V6+bHJo9EY1HOJjgKicEOem
 H3hsbojZ68Eoz33O7jArZNyn94fqogYXFdGnHqYYrgHC7bbE0nwsvFMJQeJCqFCfv5
 zr0bhO3aXsyQq8ZmBEfa/uZ3aAOumXqb8eBIoiJfyClIK23k3F00ElUu2/HYxTf7Er
 0mM6CtNrc5oj2j9zwTjfCFuQOzXc6ep8fuifOOJu39B8l//hTf8dkTVtWYJQvL/yI9
 QiM7cJjwthPR6wvrBm3dqWhPAyDtPvYvzUV4EKjRRoFK9iAxI4SRdo1czmu6cG3wkz
 wP7tLP1Lv7kzQ==
Date: Tue, 19 Jan 2021 20:22:20 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH] soundwire: debugfs: use controller id instead of link_id
Message-ID: <20210119145220.GS2771@vkoul-mobl>
References: <20210115162559.20869-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210115162559.20869-1-srinivas.kandagatla@linaro.org>
Cc: alsa-devel@alsa-project.org, gregkh@linuxfoundation.org,
 pierre-louis.bossart@linux.intel.com, linux-kernel@vger.kernel.org,
 sanyog.r.kale@intel.com, yung-chuan.liao@linux.intel.com
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

On 15-01-21, 16:25, Srinivas Kandagatla wrote:
> link_id can be zero and if we have multiple controller instances
> in a system like Qualcomm debugfs will end-up with duplicate namespace
> resulting in incorrect debugfs entries.
> 
> Using id should give a unique debugfs directory entry and should fix below
> warning too.
> "debugfs: Directory 'master-0' with parent 'soundwire' already present!"

Yeah id is guaranteed to be unique so this will work.

Applied, thanks

-- 
~Vinod
