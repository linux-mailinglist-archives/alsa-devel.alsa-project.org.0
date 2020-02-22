Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F67416907F
	for <lists+alsa-devel@lfdr.de>; Sat, 22 Feb 2020 17:51:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5B18F16D5;
	Sat, 22 Feb 2020 17:50:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5B18F16D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582390277;
	bh=24jyoZB2dH130XFae9bUoJJHGg9W/NMPL3o9HE+bCBY=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mAH+JsjmrFUdZxk7EIJ8AumNfloQComAcFzbReo3zQSQg/uaCdzm+enbQC4jrBEq0
	 Yge1JURzrHBMIN76VRcbwXc3o3aNsjKx2wJw8lyqrnc7qo0b/WF+CPBFeXl7LiCYQe
	 z7Xez5kMYDJK3vPiV9HiK+JfvVdyLpAc6wISJf4M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2546DF800F3;
	Sat, 22 Feb 2020 17:49:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 714DBF80148; Sat, 22 Feb 2020 17:49:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS,
 UNPARSEABLE_RELAY autolearn=disabled version=3.4.0
Received: from apparatus.de (apparatus.de [116.203.57.180])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2290AF800F3
 for <alsa-devel@alsa-project.org>; Sat, 22 Feb 2020 17:49:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2290AF800F3
Received: from authenticated-user (PRIMARY_HOSTNAME [PUBLIC_IP])
 by apparatus.de (Postfix) with ESMTPA id EA0CA23585D
 for <alsa-devel@alsa-project.org>; Sat, 22 Feb 2020 16:49:29 +0000 (UTC)
Subject: Re: snd_dice: Clicking artifacts with TC StudioKonnekt 48
To: alsa-devel@alsa-project.org
References: <921a3b13-b44e-3300-bb72-84cbc9e3dd88@apparatus.de>
 <20200222012510.GA4883@laptop>
From: Mathias Buhr <napcode@apparatus.de>
Autocrypt: addr=napcode@apparatus.de; keydata=
 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
Message-ID: <e29617da-9d34-c99f-f425-5d2aef59b623@apparatus.de>
Date: Sat, 22 Feb 2020 17:49:29 +0100
MIME-Version: 1.0
In-Reply-To: <20200222012510.GA4883@laptop>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US-large
Authentication-Results: apparatus.de;
 auth=pass smtp.auth=buhr@apparatus.de smtp.mailfrom=napcode@apparatus.de
X-Spamd-Bar: /
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

Thanks for your reply Takashi! It clarifies the situation. I'lll stick
with ffado then.

Regards,

Mathias


