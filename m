Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0862868C071
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Feb 2023 15:48:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 17F1DDF;
	Mon,  6 Feb 2023 15:48:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 17F1DDF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675694936;
	bh=TH+PAHQpA1SthDfdGU2CXTiwSGxzXPWpUKWd18Bsuho=;
	h=Date:From:Subject:To:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=p6ay+u0SqPVztkvAQnPIsQlGc4Tbm67pJ7BHltRC/11x1RQOOd6rO+K8UoggICyLb
	 nNfHPbeJLXLau0ZFR6nTgpTWlYzvmS7GAquVd1gr0LJrl+VUn7aTv/ZUYwikILAWds
	 ZMlqmlwaZsVtSJhY7TkgtBon1PbmwCJr9r6nyCKU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2AF2FF8014B;
	Mon,  6 Feb 2023 15:47:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4A336F804F1; Mon,  6 Feb 2023 15:47:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0557FF8014B
 for <alsa-devel@alsa-project.org>; Mon,  6 Feb 2023 15:47:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0557FF8014B
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 secure) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256
 header.s=mail20150812 header.b=LHGGk1wd
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4P9TdK2Bwfz9sSN
 for <alsa-devel@alsa-project.org>; Mon,  6 Feb 2023 15:47:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1675694869;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=1dRd2TmEkwbzOOPQ4qnQcOmZ/bzUW7hJZZYOvhnc+P8=;
 b=LHGGk1wd3JroplkqDgOsMaevyKQ5F6r6StWzdA2743/n3gDqgoM4xRfK/L7Cy6+dgQhUYQ
 601HiCMaDLvY84XRYlTMdq1tZFvrHczv+Gt97RkBxBXhprG8/FKfb9Tj5Rghd9esX7Ok03
 UxV72OuHZZkTMIAUoaVwuOsUhSSEZO+O/TNUvhyHd4w8358I+JRC5+9K/SJjpuqgWRoY+I
 fqOH5lJZAvcGcqvC6Kfhjv0gdQ5DKR66AlNQ52fOe1WcymZBJ0QXopXl2CfuntW/SfEyBp
 htSpBsI2KsmztTz4TJrpnL/8g9j2bJlm1m32eXkfioVpaIH4ojrc0q1yNrwuBA==
Message-ID: <aa029de8-3ab1-5cda-fc3b-979999bfd965@mailbox.org>
Date: Mon, 6 Feb 2023 15:47:48 +0100
MIME-Version: 1.0
From: Carlos Rafael Giani <crg7475@mailbox.org>
Subject: sample_size field in snd_dec_flac structure
To: alsa-devel@alsa-project.org
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 0431f22ac1d83d8da19
X-MBO-RS-META: 9e3rz9xfoi1wed4hq9g8999qcqaownik
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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

In snd_dec_flac (see: 
https://github.com/torvalds/linux/blob/master/include/uapi/sound/compress_params.h#L291 
), there is the sample_size field.

It seems to me that this is meant to contain the same value as the 
sample size as the one in the frame header: 
https://xiph.org/flac/format.html#frame_header

Does this mean that if I always send a full FLAC stream into the device, 
with its complete STREAMINFO header, I can just always set sample_size 
to 0? The spec does mention that 0 mean "get [the sample size] from 
STREAMINFO metadata block".

