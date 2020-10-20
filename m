Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EC9E6294DC3
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Oct 2020 15:42:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8FB37175E;
	Wed, 21 Oct 2020 15:41:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8FB37175E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603287751;
	bh=UnR6al4TfI/LHufjFtWYQVkStkD8BNPrASQagY1ffY8=;
	h=From:Date:Subject:To:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=JmAmbCBDJ14HBCGT3nMo50dg7H/hZxT7ufq4wtawNfANLS/oHmn6eh+pJhfJMspgM
	 fRxpqWWd0ZOQoQI7JibYk/nFjcXwU7e7gc6sWuvX5OTZyX48y2AVJRrDLMdj59vOne
	 0ASJdznQXH46LiW2ZvRRci+wRh3hq/qGVofl34Oo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 534CFF804E6;
	Wed, 21 Oct 2020 15:37:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 736F3F801F2; Tue, 20 Oct 2020 05:34:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,HTML_MESSAGE,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E7E1FF80090
 for <alsa-devel@alsa-project.org>; Tue, 20 Oct 2020 05:34:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E7E1FF80090
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="tEbU3z7r"
Received: by mail-wm1-x334.google.com with SMTP id a72so258943wme.5
 for <alsa-devel@alsa-project.org>; Mon, 19 Oct 2020 20:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=tDT84lPU9uoUk+X4P4mDAOlKQgChPjhQNxlwpYGYatw=;
 b=tEbU3z7rmjQFHTQnaSH7WUhDbj4NW8XqRHDrmeTsA/fwvkkBgS+EnvjNMm9eVe7R+V
 L8SKuLhBIsJ2PP+GERfG2RyRlOmSYwBpmcnWrW6xqKp4ZAo8NJu78WYT6rLjwkh7BUi+
 M+JD2VYQTNSbGTF2aLVnm8hd5jpgGceOZRoO/F7P7iQaNdyczThixEldlYAxRp/rMPrU
 g8di5aGCl7G8DcimH/hSgDXI9+xVI+wCNs1LZiiftyEPjM9pfiC2pg+YXRAvFPGjFG17
 G/kSaWqLDWA9Cx0PSVo7C+yEtKKgmaU+LvGnPBWv7gpZ1NDSNi9XKxQiLctxzg0DYXhj
 ExEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=tDT84lPU9uoUk+X4P4mDAOlKQgChPjhQNxlwpYGYatw=;
 b=htzx1JtUnkePwBOM+Jbp2u9XCZx1QUmi9CTGiEYZ2IJ7z6gXZt7XUniFsAwsYtV+rD
 DKc8COB/LbsiJlMvYmLefjMITqKUAJwfK9qPsWrYUoJdeFT71avqsAgMuz6txiqheDz4
 fcfR7cWYakr8slsRM2RtwSKkfhzlgQheauEYBJfPHdvstMzBnsYrAwALefAJ2NyAnUKB
 o55uSvzmZ8EGt/ILLIxgNhtcw3TkN7q1gFyOdYG8V/OlsPKGdYxslz158E9PI5C5Q4Ux
 KrG7iZc2QY+F7IgsezzUqHG3AbHpYJshxFFcpwfVbxACDDCERUWn2m1LrA7KHv2e4lAM
 pZLA==
X-Gm-Message-State: AOAM531Yq3bMjeLU/iwVufpQ5V6ca6R9uwpMG1Z0LkohpcYiCq59f+9N
 oSIzrqREz5AH1ai8HSHM1w0Xe5bIqjBegyyeZpXgnUrRiJeB3A==
X-Google-Smtp-Source: ABdhPJxS2h6Ryd4EqI/+6RFXQSAiD67siJ+f1Sd3sbg/SkRr+tFHvL8f+M1hKcpm7afP5EyK/xJRQOYgGkC8vgYteBg=
X-Received: by 2002:a05:600c:d3:: with SMTP id
 u19mr579122wmm.150.1603164882065; 
 Mon, 19 Oct 2020 20:34:42 -0700 (PDT)
MIME-Version: 1.0
From: Amanda Ava Koci Pereira <arsoftware10@gmail.com>
Date: Mon, 19 Oct 2020 23:32:12 -0300
Message-ID: <CALAz8EWAKP-LaeDyQZW0BauwYBthSbgJgxRT8hypuXEWEOfPhA@mail.gmail.com>
Subject: How to downmix 5.1 and 7.1 channels to 2 channels
To: alsa-devel@alsa-project.org
X-Mailman-Approved-At: Wed, 21 Oct 2020 15:37:33 +0200
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
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

Hi guys...

We need some clues about to downmix 5.1 and 7.1 channels to 2 channels

for the moment we are using the following code ->

It works but fails miserably if all channels have data at same time


#define AR_K_P_ATTENUATION_LEVEL 1.0

int p = 0;
int i;
int save_channel_0_k_p;
int save_channel_1_k_p;
double save_channel_0_data_double_k_p;
double save_channel_1_data_double_k_p;
double sample_double_temp_k_p;
int number_of_samples_k_p = decoded_frame->nb_samples;
int ricardo_deslocador__ = 0;
frame_processed_k_p = 1;

int outputBufferLen = number_of_samples_k_p * 2 * 2;
*size_out=outputBufferLen;
short *outputBuffer = (int16_t *)buf;
int16_t * ar_buffer_ = (int16_t *) decoded_frame->data[0];

for(i=0; i < number_of_samples_k_p; i++)
{
//channel 0
int16_t sample_k_p = ar_buffer_[ricardo_deslocador__++];

save_channel_0_k_p = p;

save_channel_0_data_double_k_p = (double) sample_k_p;

p++;

///////////////////////////////////////////////
//channel 1
sample_k_p = ar_buffer_[ricardo_deslocador__++];

save_channel_1_k_p = p;//so usa no final...

save_channel_1_data_double_k_p = (double) sample_k_p;

p++;

////////////////////////////////////////////////
//center
sample_k_p = ar_buffer_[ricardo_deslocador__++];

sample_double_temp_k_p = (double) sample_k_p;

sample_double_temp_k_p *= AR_K_P_ATTENUATION_LEVEL;

save_channel_0_data_double_k_p += sample_double_temp_k_p;

if(32767.0 < save_channel_0_data_double_k_p)
{
save_channel_0_data_double_k_p = 32767.0;
}

if(-32768.0 > save_channel_0_data_double_k_p)
{
save_channel_0_data_double_k_p = -32768.0;
}

sample_double_temp_k_p = (double) sample_k_p;

sample_double_temp_k_p *= AR_K_P_ATTENUATION_LEVEL;

save_channel_1_data_double_k_p += sample_double_temp_k_p;

if(32767.0 < save_channel_1_data_double_k_p)
{
save_channel_1_data_double_k_p = 32767.0;
}

if(-32768.0 > save_channel_1_data_double_k_p)
{
save_channel_1_data_double_k_p = -32768.0;
}

//////////////////////////////////////////////////////
///////subwoffer
sample_k_p = ar_buffer_[ricardo_deslocador__++];

sample_double_temp_k_p = (double) sample_k_p;

sample_double_temp_k_p *= AR_K_P_ATTENUATION_LEVEL;

save_channel_0_data_double_k_p += sample_double_temp_k_p;

if(32767.0 < save_channel_0_data_double_k_p)
{
save_channel_0_data_double_k_p = 32767.0;
}

if(-32768.0 > save_channel_0_data_double_k_p)
{
save_channel_0_data_double_k_p = -32768.0;
}

sample_double_temp_k_p = (double) sample_k_p;

sample_double_temp_k_p *= AR_K_P_ATTENUATION_LEVEL;

save_channel_1_data_double_k_p += sample_double_temp_k_p;

if(32767.0 < save_channel_1_data_double_k_p)
{
save_channel_1_data_double_k_p = 32767.0;
}

if(-32768.0 > save_channel_1_data_double_k_p)
{
save_channel_1_data_double_k_p = -32768.0;
}
////////////////////////////////////////////////////
/////surround left 4
sample_k_p = ar_buffer_[ricardo_deslocador__++];

sample_double_temp_k_p = (double) sample_k_p;

sample_double_temp_k_p *= AR_K_P_ATTENUATION_LEVEL;

save_channel_0_data_double_k_p += sample_double_temp_k_p;

if(32767.0 < save_channel_0_data_double_k_p)
{
save_channel_0_data_double_k_p = 32767.0;
}

if(-32768.0 > save_channel_0_data_double_k_p)
{
save_channel_0_data_double_k_p = -32768.0;
}
///////////////////////////////////////////////
//////////surround right 5
sample_k_p = ar_buffer_[ricardo_deslocador__++];

sample_double_temp_k_p = (double) sample_k_p;

sample_double_temp_k_p *= AR_K_P_ATTENUATION_LEVEL;

save_channel_1_data_double_k_p += sample_double_temp_k_p;

if(32767.0 < save_channel_1_data_double_k_p)
{
save_channel_1_data_double_k_p = 32767.0;
}

if(-32768.0 > save_channel_1_data_double_k_p)
{
save_channel_1_data_double_k_p = -32768.0;
}
/////////////////////////////////////////////
//finalizing

outputBuffer[save_channel_0_k_p] = (signed short)
save_channel_0_data_double_k_p;
outputBuffer[save_channel_1_k_p] = (signed short)
save_channel_1_data_double_k_p;
}

/*

if possible point us to the files in ALSA that make the downmix and it will
be enough

Thanks a lot

*/

Ricardo
