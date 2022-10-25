Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 657BE60C45E
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Oct 2022 08:57:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 130A45AE9;
	Tue, 25 Oct 2022 08:56:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 130A45AE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666681041;
	bh=e2DQ47Rq1pBmGfTstR1nZfpLsCOeH9IAVRaWzpuzoxg=;
	h=Date:To:From:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=jekvzW6pWX7f9OC794ge6WXpgPwm1M/0gtZVH91bogD2UqG9SnWsLh/OCgo6H25lt
	 eZtJbfn+MJI/xMvElB+QL7X1xn19P1R0B4J98TBfmCSpkqsnzoDsXCV9AWiuBXaCmK
	 5txRtVWoMmz/EnVQpE7ESjVhOt1jI1CrlBSMcTSg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 347E9F80448;
	Tue, 25 Oct 2022 08:56:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2C9C5F80431; Tue, 25 Oct 2022 08:56:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5D608F80100
 for <alsa-devel@alsa-project.org>; Tue, 25 Oct 2022 08:56:17 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id C1F38A0040
 for <alsa-devel@alsa-project.org>; Tue, 25 Oct 2022 08:56:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz C1F38A0040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1666680976; bh=SEnxBOmsMmfrU2T+yyc5L5xJ3Z/FFBvlTye2V4IhGt8=;
 h=Date:To:From:Subject:From;
 b=ZY/TeKB/4X1oq+ab9Q+NiGGIKPAMueuQADVX+8K8KFj4fzRDoZ9MJR3xcwzgTwNrj
 dcfEI8f6cZzaCTAjrG8lp9pv9GKpwo20DJaOQfiwldQiAfMpnA2OJQYKYztINItKr8
 7VwMQxCoTiWhqDmihB2CJLn1QtxnozCUV2xFOZLs=
Received: from [192.168.100.98] (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA
 for <alsa-devel@alsa-project.org>; Tue, 25 Oct 2022 08:56:15 +0200 (CEST)
Message-ID: <042e2b9f-6e1c-b821-0b30-d317ea771172@perex.cz>
Date: Tue, 25 Oct 2022 08:56:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: ALSA development <alsa-devel@alsa-project.org>
From: Jaroslav Kysela <perex@perex.cz>
Subject: ALSA 1.2.8 release
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Hello all,

	new ALSA userspace packages were released. You may download them from
the ALSA website http://www.alsa-project.org or directly:

	HTTP: https://www.alsa-project.org/files/pub
	FTP:  ftp://ftp.alsa-project.org/pub

Released packages:

	alsa-lib
	alsa-utils
	alsa-ucm-conf
	tinycompress

Full list of changes:

	https://www.alsa-project.org/wiki/Changes_v1.2.7.2_v1.2.8

The fingerprint of the public signing key is:

	F04D F507 37AC 1A88 4C4B 3D71 8380 596D A6E5 9C91

				Have fun,
					Jaroslav
-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
