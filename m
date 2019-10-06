Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A980CD1D2
	for <lists+alsa-devel@lfdr.de>; Sun,  6 Oct 2019 14:09:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 085E915E0;
	Sun,  6 Oct 2019 14:08:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 085E915E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570363778;
	bh=zlNl66XHGChlzi1DjX17gOjrmVm8CPWpvt3ZP8P5iOo=;
	h=Date:From:To:To:To:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=M4pYx9D9cfetiqFHo0t4X9rkX3WXW841iYHH9V5MVj0V2f41y4oX0MB6dQjkpF69f
	 I8NKKezzjpdmCVzGS4omVtj0O80meK3boMJfdUDnnEXWuAFtHLuE+c2xLRkBZh+f3+
	 KLX5HWjwhfCuRyZiw0LtZfdq4Ni5H+vjBw9hEniU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 342FEF8038F;
	Sun,  6 Oct 2019 14:07:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B953DF8038F; Sun,  6 Oct 2019 14:07:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8084AF80137
 for <alsa-devel@alsa-project.org>; Sun,  6 Oct 2019 14:07:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8084AF80137
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="QbBp/qZ9"
Received: from localhost (unknown [40.117.208.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 759152087E;
 Sun,  6 Oct 2019 12:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1570363664;
 bh=DGr5gLl9sxdL65Ry6x1pUQSfByI1eIRWXUmc2X9Vj5M=;
 h=Date:From:To:To:To:Cc:Cc:Cc:Subject:In-Reply-To:References:From;
 b=QbBp/qZ9DT8eQ81trFPJOOSh/pbhJMDlSmfTwrXT4u/5roEFw9MukpLzk0lTh+ju8
 4OaUu0wQKnwFsqQb51KyC/3WnLhTa+UCGvr9MKndrXc7CC+n5sAquHQPLdYk00ozgh
 OJp+emDH5wcyDlAaevaAp9iiDAKcDkiSQWIiGnek=
Date: Sun, 06 Oct 2019 12:07:43 +0000
From: Sasha Levin <sashal@kernel.org>
To: Sasha Levin <sashal@kernel.org>
To: Michal Suchanek <msuchanek@suse.de>
To: alsa-devel@alsa-project.org
In-Reply-To: <bd685232ea511251eeb9554172f1524eabf9a46e.1570097621.git.msuchanek@suse.de>
References: <bd685232ea511251eeb9554172f1524eabf9a46e.1570097621.git.msuchanek@suse.de>
Message-Id: <20191006120744.759152087E@mail.kernel.org>
Cc: , Vinod Koul <vkoul@kernel.org>, Michal Suchanek <msuchanek@suse.de>,
 stable@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH v2 1/2] soundwire: depend on ACPI
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi,

[This is an automated email]

This commit has been processed because it contains a "Fixes:" tag,
fixing commit: 7c3cd189b86d soundwire: Add Master registration.

The bot has tested the following trees: v5.3.2, v5.2.18, v4.19.76.

v5.3.2: Build OK!
v5.2.18: Failed to apply! Possible dependencies:
    8676b3ca4673 ("soundwire: fix regmap dependencies and align with other serial links")

v4.19.76: Failed to apply! Possible dependencies:
    8676b3ca4673 ("soundwire: fix regmap dependencies and align with other serial links")
    9d7cd9d50082 ("soundwire: Kconfig: fix help format")


NOTE: The patch will not be queued to stable trees until it is upstream.

How should we proceed with this patch?

-- 
Thanks,
Sasha
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
