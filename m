Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0639CFDFD1
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Nov 2019 15:14:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 72E4A1667;
	Fri, 15 Nov 2019 15:14:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 72E4A1667
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573827291;
	bh=2k8HD+5hnrToikWRU+kIajj2utTZqFDxkVc98uDfZDI=;
	h=References:From:To:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=N2UyRa7bZOcX08D0Ign0TJ+9aZWD85w8xcX8r8TnH5YKfQ5UHEAi8awMOqoPhLhzp
	 evzmYlpfMNsMqKlmZUWEShlos5iytOU3Ffh/bwO6kvzsTuVTNfZftPfJWdjNXRfNl6
	 UAnEkDv7MBOWIEps8vwwIzGB/i7vw0id9SQKnhr4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3678DF80106;
	Fri, 15 Nov 2019 15:13:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 52828F80104; Fri, 15 Nov 2019 15:13:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CA2ACF800CC
 for <alsa-devel@alsa-project.org>; Fri, 15 Nov 2019 15:13:01 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 873CEA003F;
 Fri, 15 Nov 2019 15:13:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 873CEA003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1573827180; bh=291SjE9LD8dZmRiIlBtdPNwi5kL+jdaWgdF5YsnNhHk=;
 h=Subject:References:From:To:Cc:Date:In-Reply-To:From;
 b=1M5YbwtN2sAZWavthkwGb9vYxE5FdrPf44uw7P3JFLfhDmZJknVy2mShe/dbldXXU
 um2UdfDZRjzvFnhPtmUne1s6z0p4hB1LVszJnGYgMpGUrSCXVv+oHpVDXu36kLBR3R
 mEYSi3DzdJpojVf7wl9LqjKlp0/9gnYaZBxZBcDc=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Fri, 15 Nov 2019 15:12:58 +0100 (CET)
References: <ed96d068-79ae-18ab-e24e-b3ac07897cfc@perex.cz>
From: Jaroslav Kysela <perex@perex.cz>
To: ALSA development <alsa-devel@alsa-project.org>
X-Forwarded-Message-Id: <ed96d068-79ae-18ab-e24e-b3ac07897cfc@perex.cz>
Message-ID: <07f9c6fd-0dcf-e399-b012-05cd2cf6aced@perex.cz>
Date: Fri, 15 Nov 2019 15:12:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <ed96d068-79ae-18ab-e24e-b3ac07897cfc@perex.cz>
Content-Language: en-US
Cc: Takashi Iwai <tiwai@suse.de>
Subject: [alsa-devel] ALSA 1.2.1 release
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hello all,

   new ALSA userspace packages were released. You may download them from
the ALSA website http://www.alsa-project.org or directly from the FTP
server ftp://ftp.alsa-project.org/pub .

Full list of changes:

   http://www.alsa-project.org/main/index.php/Changes_v1.1.9_v1.2.1

A few remarks to alsa-lib:

- the topology routines were moved to library libatopology.(a|so)
- ucm configuration syntax was improved (ucm2)
- ucm configuration files were moved to alsa-ucm-conf package
   (3-clause BSD licence)
- topology configuration files were moved to alsa-topology-conf
   package (3-clause BSD licence)

Because of all above changes, I decided to increase the second version
number to 2. There are two reasons:

- keep the version number in three digits ;-)
- the package maintaners should be more careful to handle the ucm and topology
   configuration split

				Have fun,
					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
