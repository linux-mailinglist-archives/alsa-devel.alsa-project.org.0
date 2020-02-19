Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F6F7164B97
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Feb 2020 18:13:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C1A9D16A4;
	Wed, 19 Feb 2020 18:12:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C1A9D16A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582132401;
	bh=bM8RZQ2p9Y9TlpQXEupjet7yRPfvzJe7Parl9LzVp2g=;
	h=Subject:References:To:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=J6ZK/HxZscYxUyKV+/4SYPzrnFSZNdZKp187FgjwDzFU0yFThYwSwkoPnCPqda8pe
	 lWQl734GKVQ2sTbXWQw/9LzAxuR/1ILddqs7hxuWRxKuo8tRI7hwC9VMm+SheWLfvz
	 5RPd6i4e00q3uozGnWZivcyGhqvk7ubGmcFOKHz0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9EEA2F80273;
	Wed, 19 Feb 2020 18:11:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2506FF80273; Wed, 19 Feb 2020 18:11:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7EAFDF80142
 for <alsa-devel@alsa-project.org>; Wed, 19 Feb 2020 18:11:33 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 99A2CA003F
 for <alsa-devel@alsa-project.org>; Wed, 19 Feb 2020 18:11:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 99A2CA003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1582132292; bh=Ms1up04mtyr9vNfLop1FZwfgs49Qf7mwFnKfLSEJniE=;
 h=Subject:References:To:From:Date:In-Reply-To:From;
 b=QSnY0hlsfA6A/dNhNsLvdY290zgHc5YZ1fOMUO1avX63VPyWvfO1T53zI2Jckuqqp
 2dvaxa4P97VTuCZlp3qhTqAFt4LNs1vssnxWuFwnP26VzFl9ae/P2qAFN8dIgF0VWG
 jpF6ABntIRGaHv9qwDBFYYmKnO0dx4nksGLqW4Jw=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA
 for <alsa-devel@alsa-project.org>; Wed, 19 Feb 2020 18:11:31 +0100 (CET)
Subject: ALSA 1.2.2 release
References: <07f9c6fd-0dcf-e399-b012-05cd2cf6aced@perex.cz>
To: ALSA development <alsa-devel@alsa-project.org>
From: Jaroslav Kysela <perex@perex.cz>
X-Forwarded-Message-Id: <07f9c6fd-0dcf-e399-b012-05cd2cf6aced@perex.cz>
Message-ID: <7e4dda4e-89bb-00af-1804-b79f4611278e@perex.cz>
Date: Wed, 19 Feb 2020 18:11:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <07f9c6fd-0dcf-e399-b012-05cd2cf6aced@perex.cz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
the ALSA website http://www.alsa-project.org or directly from the FTP
server ftp://ftp.alsa-project.org/pub .

Full list of changes:

    http://www.alsa-project.org/main/index.php/Changes_v1.2.1.2_v1.2.2


				Have fun,
					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
