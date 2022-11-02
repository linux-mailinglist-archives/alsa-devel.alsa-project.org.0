Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CD0C7615DAC
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Nov 2022 09:29:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6BAC9168B;
	Wed,  2 Nov 2022 09:29:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6BAC9168B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667377790;
	bh=jwdZmLh2rquz77Nbou7xfF1kqlEcuqWvpyMsX8C3WCo=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tKc5S+cb2mYbeQfduzS6/AtFfdp+JxhRBSvt7WeYVmBUJy8a4KOZOZJuhIjcpTplY
	 TzTSKI3YKutnKeK6IL1umhjei0Q8NCiTbGG/KSXoMGmis9ZPIOLfzdT4AJD5iwiTdw
	 WiGlhv1FKWgr7F2nKENT0LolCP8lev7zMUEUp6UM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C2C45F80423;
	Wed,  2 Nov 2022 09:28:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7FDF1F8026D; Wed,  2 Nov 2022 09:28:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id E805BF80155
 for <alsa-devel@alsa-project.org>; Wed,  2 Nov 2022 09:28:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E805BF80155
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1667377723910022020-webhooks-bot@alsa-project.org>
References: <1667377723910022020-webhooks-bot@alsa-project.org>
Subject: Add support for getting list of supported codecs
Message-Id: <20221102082851.7FDF1F8026D@alsa1.perex.cz>
Date: Wed,  2 Nov 2022 09:28:51 +0100 (CET)
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

alsa-project/tinycompress pull request #16 was edited from SanchayanMaity:

Right now, there is no way to expose a list of codecs from `tinycompress`. While one could theoretically call `is_codec_supported` multiple times in an application to check against a list of codecs, an API would make it easy to enumerate supported codecs. The IOCTL `SNDRV_COMPRESS_GET_CAPS` after all already exists.

Our use case is Pipewire where we would like the compressed sink node to advertise only codecs supported by the underlying hardware. So far we were just advertising the complete list of codecs and let node linking fail at runtime based on result from `is_codec_supported`. 

Pipewire MR: https://gitlab.freedesktop.org/pipewire/pipewire/-/merge_requests/1431

Request URL   : https://github.com/alsa-project/tinycompress/pull/16
Patch URL     : https://github.com/alsa-project/tinycompress/pull/16.patch
Repository URL: https://github.com/alsa-project/tinycompress
