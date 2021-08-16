Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E02273EDB2A
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Aug 2021 18:44:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6464D16B3;
	Mon, 16 Aug 2021 18:44:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6464D16B3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629132291;
	bh=pRlN4ntaxNxZ3FhJD/Tt/CJCwv/1JoButnAjITMh61k=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Um3JNLErUU/mSQ1w7lRfex7yIpn5/UJ49g7d0kZGD2o5ypnbAmvCNKXdpx+ZktEOh
	 k4vj5lKjTlYxeKJmBpIrZsUpSFg1O6i1FE9fkVhGLlDhhwjJXcEYD5eZ3br047PBK5
	 Fwm62JnP4zNsTG9NcWLgrRTeX6vQ7KX+rzZEe6A0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B1E65F800AF;
	Mon, 16 Aug 2021 18:43:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 779C2F80249; Mon, 16 Aug 2021 18:43:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-relay-canonical-0.canonical.com
 (smtp-relay-canonical-0.canonical.com [185.125.188.120])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C805DF80154
 for <alsa-devel@alsa-project.org>; Mon, 16 Aug 2021 18:43:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C805DF80154
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com
 header.b="s7Q8jp6i"
Received: from [10.172.193.212] (1.general.cking.uk.vpn [10.172.193.212])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id F07123F04D; 
 Mon, 16 Aug 2021 16:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1629132186;
 bh=0Aci3PtlGfoMUvbObF/5DAnE61QA6srUCQf5qmnkZSs=;
 h=From:To:Cc:Subject:Message-ID:Date:MIME-Version:Content-Type;
 b=s7Q8jp6iDjOscuUyTOeoDhes/D3AdsCB/AsTwmX+AiT+Am3c7PgzvmRtKDZQHJ0mD
 iwO7JU1lmV92Nxg56z1VRrYR2GnNOiQG8YTIHWiDdf2QRaUlbdeU+Gqq7VKMDV9x/+
 ZnV0Ur40kAJoVRdepgSAUhPUVDpK/SLjo+1Q+hZIaysFVRLsY1uW0chwbcxb7CbFqo
 GIUO8OAgJQmHyT7WPB8esfy/+O1e17gToO83xUO1AS0yUMlmqQkV5J5nfussflOOST
 0jQaM+weVM1dFtM6pzAnbSQ9uOjZ9T2LADtzHKVXqCjLThDknxGWXtL8D2M0RKgBDZ
 pSh4JxbV4kX4Q==
From: Colin Ian King <colin.king@canonical.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Subject: re: ASoC: sh: Add RZ/G2L SSIF-2 driver
Message-ID: <962029d0-d001-f85c-1676-262372faeb34@canonical.com>
Date: Mon, 16 Aug 2021 17:43:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Hi,

Static analysis on linux-next with Coverity has detected an issue in
rz_ssi_stop, sound/soc/sh/rz-ssi.c with the following commit:

commit 03e786bd43410fa93e5d2459f7a43e90ff0ae801
Author: Biju Das <biju.das.jz@bp.renesas.com>
Date:   Fri Aug 13 10:11:54 2021 +0100

    ASoC: sh: Add RZ/G2L SSIF-2 driver


The analysis is as follows:

367
368        /* Wait for idle */
369        timeout = 100;
370        while (--timeout) {

Wrong operator used (CONSTANT_EXPRESSION_RESULT)

operator_confusion: rz_ssi_reg_readl(ssi, 4) | (33554432UL /* 1UL << 25
*/) is always 1/true regardless of the values of its operand. This
occurs as the logical operand of if.

371                if (rz_ssi_reg_readl(ssi, SSISR) | SSISR_IIRQ)
372                        break;
373                udelay(1);
374        }

I suspect the & operator was intended to mask the specific bit. However
I'm not sure if the intent is to detect if the SSISR_IIRQ bit should be
zero or one at the point where the break should occur, hence I'm
reporting this issue.

Colin
