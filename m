Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F6FE3A2AD9
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Jun 2021 13:55:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 52BD0178C;
	Thu, 10 Jun 2021 13:54:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 52BD0178C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623326119;
	bh=zyLGIhMelTrKmjD64+4lMcfrQmC2wjVKVf3hR/rcqWc=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JKYhn6fDnFe8IupYZkaWxtlu4WEkYpBJ/7oGd/rBwaC6yzkgCaO3v/86R1alj6C2Z
	 s3hEvj9MOXS+8Ac9pHKW1rE8eTOfj/4hUVV5pT62E72YbV3O+7PW6W7eQpdM+v10W+
	 zeEgr9CrcOsAcantXBhJ+f+CbLC1/pjPfS9TCzzI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C51CDF801EC;
	Thu, 10 Jun 2021 13:53:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B0069F80218; Thu, 10 Jun 2021 13:53:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 71534F801EC
 for <alsa-devel@alsa-project.org>; Thu, 10 Jun 2021 13:53:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 71534F801EC
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1623326022462129116-webhooks-bot@alsa-project.org>
References: <1623326022462129116-webhooks-bot@alsa-project.org>
Subject: Undeclarated constant
Message-Id: <20210610115350.B0069F80218@alsa1.perex.cz>
Date: Thu, 10 Jun 2021 13:53:50 +0200 (CEST)
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

alsa-project/alsa-plugins issue #24 was opened from unknown2045:

Hi,
I am trying to install the alsa-plugins, when I do the make command I get the following errors:

![Captura de pantalla de 2021-06-10 13-52-37](https://user-images.githubusercontent.com/85682900/121520376-229ecb00-c9f3-11eb-9230-3f5ace4c3042.png)

How can I solve it?

Thanks in advance!

Issue URL     : https://github.com/alsa-project/alsa-plugins/issues/24
Repository URL: https://github.com/alsa-project/alsa-plugins
