Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D8760C1EE
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Oct 2022 04:51:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8E3624BA7;
	Tue, 25 Oct 2022 04:51:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8E3624BA7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666666318;
	bh=tMbVL32QeZpARqqXYF6Nga2FXudA6Mo1rluvSqxX+F8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fQ1NevfS3Z42w8VUA7La6hEyFL/FPZ/dCWitR9gNMKi18OpwjiBfkWnfIeYEKr7Yi
	 goD5X3oK6EX0yFidnuFQ8AEb2oF5/f/cbUYvMNgdIukc2cuxjHzRFoquxt+e40IDYH
	 hED3BErnrwsBHbysB0g3hu3Vg/GRgUD28D3zJ92Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0D5CFF80448;
	Tue, 25 Oct 2022 04:51:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BF7E4F80431; Tue, 25 Oct 2022 04:51:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 49032F80240
 for <alsa-devel@alsa-project.org>; Tue, 25 Oct 2022 04:50:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 49032F80240
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="lQjU1UdJ"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2196761630;
 Tue, 25 Oct 2022 02:50:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6EEEC433C1;
 Tue, 25 Oct 2022 02:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666666256;
 bh=tMbVL32QeZpARqqXYF6Nga2FXudA6Mo1rluvSqxX+F8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lQjU1UdJisEhfivkjJUaMwXtF745fsuH9q8P27xns8WnqQuNxraFNL6zGiSoLF2Md
 VJWkZc3cm2HuiFx2xzNMpAoC1Q4ZG1Lu/XrB5iiEeow+Xeni1TfwrHx2njoDlQMHEc
 s2gyAv8ARMMakjkuRQ0iImg4vaRd52rxnJFk4eMXfKiOBRW1dVzz6kxqb0iNxM5zvS
 fXfjOm6/sVTxLooLuGjC5Ej5qONXqv+Yohmhj2uhFrmanPhAqZnQbKHp/bZ1FhGimz
 mUSCcuC7Sv6CgRzMOTR1Sl/TZuZKfT5ahBX9brB/qZgUefQhjwxxDzUCxuZEUkrcU6
 gV3dwrHekkXVg==
Date: Tue, 25 Oct 2022 10:50:53 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Subject: Re: [PATCH] MAINTAINERS: update Tzung-Bi's email address
Message-ID: <Y1dPDdGCG+n3ODuD@google.com>
References: <20221025020444.2618586-1-tzungbi@kernel.org>
 <CAGXv+5FZxFUfqvMKmT41VgubaiDN7=qZQQ2tYbT-899AOt+w7A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGXv+5FZxFUfqvMKmT41VgubaiDN7=qZQQ2tYbT-899AOt+w7A@mail.gmail.com>
Cc: alsa-devel@alsa-project.org, broonie@kernel.org
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

On Mon, Oct 24, 2022 at 07:30:48PM -0700, Chen-Yu Tsai wrote:
> On Mon, Oct 24, 2022 at 7:06 PM Tzung-Bi Shih <tzungbi@kernel.org> wrote:
> >
> > Use kernel.org account instead.
> >
> > Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
> 
> You could also update .mailmap?

Thanks.  Update in v2.
