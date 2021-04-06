Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ADAE354BDA
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Apr 2021 06:56:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9E8FD16DC;
	Tue,  6 Apr 2021 06:55:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9E8FD16DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617684966;
	bh=3oXESt8oQgiKW/qAWnzICznc5KQKnQJ+Fw+d+XpBiUE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OfE1vR9TEZQq4HkGv/aSU4o9xVW/EZika6Lew2wxFcR1CCzRe+euFCjTN6rQpqgN3
	 Ihl43enU35ZKvOC6vGlqQgGUxW1kwZllF3LxXpZFJvoOCNqz4rwE0BJjJqKgc5lHp6
	 0zmZW4dDld8/1VDs9ojMq4tfu2VEcob3RuEpliAQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 89E85F80259;
	Tue,  6 Apr 2021 06:54:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4B4F1F80258; Tue,  6 Apr 2021 06:54:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A7B1BF80124
 for <alsa-devel@alsa-project.org>; Tue,  6 Apr 2021 06:54:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A7B1BF80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ISUXBIjE"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1DC88613B7;
 Tue,  6 Apr 2021 04:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617684875;
 bh=3oXESt8oQgiKW/qAWnzICznc5KQKnQJ+Fw+d+XpBiUE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ISUXBIjEtAuFGdfzBV8TvLh/0Kd1Xv1bB2XY2PGlKDxOsfdHlAnpU13cJv1hBDpf2
 6DXbaixwTlj+LaGvXqwFrmJt9fXOO/9GeZ5T8fBhYMF6jl/xeCiPvAmfsL5aLunqYW
 PKJVZIQQWXv4t9r50kUqv1KXByTR8fdk77i1TKlP51MWi5TlYwii6DK0J/LBKT0ofO
 G3rcF/be7Rqz8GmBkdUDKfoQ7fBGJjGXOFPxxbhSDBnYVg5eNO2muYbdIqUS9Zh0DN
 2APB0OrjOxkHOqZjCWHemaiBgiZv/KnIXwJTXBlWWCDIjQWiYXgTu5ls3CtpZI/Z62
 QwRWYfMPjtecg==
Date: Tue, 6 Apr 2021 10:24:31 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v2] soundwire: qcom: wait for fifo space to be available
 before read/write
Message-ID: <YGvph03m7w5DbATC@vkoul-mobl.Dlink>
References: <20210401090058.24041-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210401090058.24041-1-srinivas.kandagatla@linaro.org>
Cc: robh@kernel.org, alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
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

On 01-04-21, 10:00, Srinivas Kandagatla wrote:
> If we write registers very fast we can endup in a situation where some
> of the writes will be dropped without any notice.
> 
> So wait for the fifo space to be available before reading/writing the
> soundwire registers.

Applied, thanks

-- 
~Vinod
