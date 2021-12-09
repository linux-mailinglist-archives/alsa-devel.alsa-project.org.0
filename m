Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FF8046F294
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Dec 2021 18:56:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 210852121;
	Thu,  9 Dec 2021 18:55:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 210852121
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639072579;
	bh=L1BjZ8uSjJMDXcioMYth4yKfPiejWglWdt+O/FHYnOk=;
	h=Date:To:From:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=vLePywrjIW0GI0p+IWrFVEKPO98cSrHOSDJgMAz0lavh+KKgXFnDF0KzcVpaNzU0H
	 nn/jBnVg5KqUrflFbmPNbgF+KdeKkgIkFuwJWgbxWqRaDzHZX4dZeY1OlVmA/SzOnr
	 wzj4qi9NkOF8bD2ySaCWCJ0+sLvydPIp1kz/9kT4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 83FC6F8028D;
	Thu,  9 Dec 2021 18:55:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8F18EF804AE; Thu,  9 Dec 2021 18:55:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5E46FF8028D
 for <alsa-devel@alsa-project.org>; Thu,  9 Dec 2021 18:54:54 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 004B6A0067
 for <alsa-devel@alsa-project.org>; Thu,  9 Dec 2021 18:54:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 004B6A0067
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1639072494; bh=rYkDLk78LlQhkOEbSbFYTS2VgD+3TkReF30Xkrna7Eg=;
 h=Date:To:From:Subject:From;
 b=EvQUy//4MzGl2B6oEGKifKx5BiK9EC+0aKeP7tFZw3uh9gKlKbRN59PfCi69P4rHG
 v5Pn/VZ+rw+x9gFbumDFcHW5/ahwTxi0Y65jcMR4M9awm/lAgF6uvPtsO/LCq5cIZb
 /ZKoU1VUxJ1Be6EXZaHSjU2LTfhG/5yyJuMhMaq4=
Received: from [192.168.100.98] (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA
 for <alsa-devel@alsa-project.org>; Thu,  9 Dec 2021 18:54:52 +0100 (CET)
Message-ID: <dd325d18-0247-279a-c3b7-e160ed039f55@perex.cz>
Date: Thu, 9 Dec 2021 18:54:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-US
To: ALSA development <alsa-devel@alsa-project.org>
From: Jaroslav Kysela <perex@perex.cz>
Subject: ALSA 1.2.6.1 release
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

       new ALSA userspace packages were released. This is a quick bugfix 
release. You may download them from the ALSA website 
http://www.alsa-project.org or directly:

       HTTP: https://www.alsa-project.org/files/pub
       FTP:  ftp://ftp.alsa-project.org/pub

Released packages:

       alsa-lib
       alsa-ucm-conf

Full list of changes:

       https://www.alsa-project.org/wiki/Changes_v1.2.6_v1.2.6.1

The fingerprint of the public signing key is:

       F04D F507 37AC 1A88 4C4B 3D71 8380 596D A6E5 9C91

				Have fun,
					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
