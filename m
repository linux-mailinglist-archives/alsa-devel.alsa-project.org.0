Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A73E8251702
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Aug 2020 13:04:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4F6531684;
	Tue, 25 Aug 2020 13:03:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4F6531684
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598353451;
	bh=blQn2SeVbxEcBnI1jOs2oREomx/oG80KsgGc3h/X+KA=;
	h=To:Subject:From:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=W1n7VUzu0vhegIAGYP//s6SzxVoJQsdY3tR/xlWav7t2iS20iZoq8Mvszauiuh6UR
	 P1a3PgulL+88D021dEGJU5KtPx6QNGzvqQYNdGAWZwz5rZSlqJ3PgMHRMhOcJQS8MZ
	 SChUIhyy/jSMzMEJ8QA/TCUQSWXzhKLKfAHETzYQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DFA95F802BC;
	Tue, 25 Aug 2020 13:01:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F1B33F801D9; Mon, 24 Aug 2020 14:30:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 02998F800B8
 for <alsa-devel@alsa-project.org>; Mon, 24 Aug 2020 14:30:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 02998F800B8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="ZuNKvYZS"
Received: by mail-wr1-x444.google.com with SMTP id a15so8484082wrh.10
 for <alsa-devel@alsa-project.org>; Mon, 24 Aug 2020 05:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:cc:subject:from:message-id:date:user-agent:mime-version
 :content-transfer-encoding:content-language;
 bh=blQn2SeVbxEcBnI1jOs2oREomx/oG80KsgGc3h/X+KA=;
 b=ZuNKvYZSYGfhn8824cXto5npj56NW3P7euqQOjYTWYNJ4lu4qz2Y9MVvS99KNPhyPK
 d8boenarX1LiYIqGtylF/9CfEr/Kat7hO3SJxGhSbBA5xRvgZPQgHBSfP8lwK7SHjlg5
 JZUxY5aumiid+ZgBKYjsTNT/Wg8TydVuhfEeZWDOoYH42SWiHWd0dXuj/tnYRiInrZVb
 bL397hBXWlx1F6gawKb7P/j5duSV2d9RC/1gGvB1hs1NXvrE1W78TTfTpwaOn39y84H+
 zNpCY3UgQ17FqiFEwRCak3scr5gE80NSfiEwdQAQctxbZZhDJgJRAIP8Y436z7OQWntB
 v0uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:subject:from:message-id:date:user-agent
 :mime-version:content-transfer-encoding:content-language;
 bh=blQn2SeVbxEcBnI1jOs2oREomx/oG80KsgGc3h/X+KA=;
 b=i7GLm6KraM+/MDl7oMyQ5AJG5/9BXtzEzfrBVUAdLRFQW9OdhcDvn1arwWc/UTlsDv
 Xel/R0O1qWjUZlez54kWfHjl/b3OsyD2yiVUj/Kvl0kCc24vmqs8+Hre9pOA7MMe0GSt
 f9kuFdGeMQeXrhyUVdaOf//44xhCU1vAzsRxozOI2m/mNE4ZZK3IyuyEG4CU/fMkdsrx
 FwpogeINf4R5M77HfHsDtIXi4pZb4x/bG5jxbwKy4aE/QtYAzRsrQZTb9H//WzlXxr5T
 QUbVYi7cs6BhRW8dkZE+SIJSLAQNgdo7Ikpn9IFj74/GrizZ48BOCT1nzMYoziv6dOhs
 BCCw==
X-Gm-Message-State: AOAM531Xp1TtBdI9q04c9EjPzsGuFXYYsVWeXvXqBLq3U2JzfupP0iBD
 k6jFKgtN90/NkZu8MQ7Ps+8=
X-Google-Smtp-Source: ABdhPJxMLm4saLPlC7reRegXV0MuiDRWXTOhyevhA90VQPUJX/W4kTYybr1DXavVW/x+lajNcNxryQ==
X-Received: by 2002:adf:f151:: with SMTP id y17mr6004761wro.179.1598272220819; 
 Mon, 24 Aug 2020 05:30:20 -0700 (PDT)
Received: from [192.168.0.16]
 (cpc83661-brig20-2-0-cust443.3-3.cable.virginm.net. [82.28.105.188])
 by smtp.gmail.com with ESMTPSA id k204sm26860359wma.21.2020.08.24.05.30.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Aug 2020 05:30:20 -0700 (PDT)
To: adrien.crivelli@gmail.com
Subject: Re: [PATCH] ALSA: hda/realtek: Add quirk for Samsung Galaxy Book Ion
 15 inches
From: Alex Dewar <alex.dewar90@gmail.com>
Message-ID: <7210c752-0a1f-3985-91f0-b70facf0293c@gmail.com>
Date: Mon, 24 Aug 2020 13:30:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-Mailman-Approved-At: Tue, 25 Aug 2020 13:01:32 +0200
Cc: alsa-devel@alsa-project.org, tiwai@suse.com, linux-kernel@vger.kernel.org
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

There's a mistake in this. The ID numbers are the wrong way round.

Alex
