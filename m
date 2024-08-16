Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B2E4954B5F
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Aug 2024 15:48:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 201F52C12;
	Fri, 16 Aug 2024 15:48:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 201F52C12
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723816093;
	bh=a2Uu8UI8V0vvRA3hscoyzszAisM9xQQnRCyxHTEGNwM=;
	h=Subject:From:To:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:Date:From;
	b=D9KszSTtXho6wXTWNTunvCUH1H4W8elp+zyt0xGq7mO3jU5WKItw8W4OxcZp1ejI0
	 f9EXqLM6nrz9z4T+Dw0JPuP9n3BUyH5mnquEBnoFNNc6cIBRjXV9g4nlRbxr02/9BQ
	 Ugbb/lbBdwmgZ1YEqYbHkO5y0cL/IaJ+q/0dI1rA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 193C5F805C0; Fri, 16 Aug 2024 15:47:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2F267F805C3;
	Fri, 16 Aug 2024 15:47:59 +0200 (CEST)
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Subject: [PATCH v1] ASoC: codecs: ES8326: Adjust buttons
From: zhangyi@everest-semi.com
To: alsa-devel@alsa-project.org
Message-ID: <20240816102034.48617-1-zhangyi@everest-semi.com>
X-Mailman-Approved-At: Fri, 16 Aug 2024 11:06:48 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/X5RQYEYPFIWUAQ3JDNPQADELNB2W3ITH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
Date: Fri, 16 Aug 2024 15:47:59 +0200 (CEST)

The content of this message was lost. It was probably cross-posted to
multiple lists and previously handled on another list.
