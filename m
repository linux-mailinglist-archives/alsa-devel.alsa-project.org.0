Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 01DB8605C69
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Oct 2022 12:35:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 693CDA0E0;
	Thu, 20 Oct 2022 12:34:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 693CDA0E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666262106;
	bh=AF1uOjUOcdbPKd9VpaWCFLH1+sLjoiPBHXXTZFjGWgo=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qz8MEWxlWBlSGlxpttn44+heC+Tqp8up6+YBWHvcE6BYjCrhDDNkL6kwrENeO+0/5
	 DbULQCGL6GjOewuxAUrGso4+fqI3tK8Illwhuwo1RjwjVVCEEeW3Me4Re1k4VCwa0p
	 GRgVdJGlymUspI5T382GN3IXLV4DI81Y4v+eGQM0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6A0A0F80548;
	Thu, 20 Oct 2022 12:33:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5EC07F8025E; Mon, 17 Oct 2022 10:09:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from zg8tmtyylji0my4xnjeumjiw.icoremail.net
 (zg8tmtyylji0my4xnjeumjiw.icoremail.net [162.243.161.220])
 by alsa1.perex.cz (Postfix) with SMTP id C66B2F80149
 for <alsa-devel@alsa-project.org>; Mon, 17 Oct 2022 10:09:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C66B2F80149
Received: from AEPW014EEK (unknown [10.28.61.203])
 by master-mail (Coremail) with SMTP id AQAAfwDX5vioDU1js+UCAA--.11366S2;
 Mon, 17 Oct 2022 16:09:16 +0800 (CST)
From: <wangweidong.a@awinic.com>
To: "'Mark Brown'" <broonie@kernel.org>
Subject: Reply to review question [PATCH V2 1/2] ASoc:codes:Add Awinic AW883XX
 audio amplifier driver
Date: Mon, 17 Oct 2022 16:09:12 +0800
Message-ID: <004301d8e1ff$c0464390$40d2cab0$@awinic.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: Adjh/4pnReKW4Z36Rw+LlHcjii8KPQ==
Content-Language: zh-cn
X-CM-TRANSID: AQAAfwDX5vioDU1js+UCAA--.11366S2
X-Coremail-Antispam: 1UD129KBjvJXoW3Kw4fCryDJrW8tr4DKFW7urg_yoWkWF4DpF
 WrJr90yFZ8tr43Zryftr40yryrAa48KFW7W3srA34kJwn8tr95tr18Gr4jvryxCFyfGF43
 Xr42gFWrCF4rA3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9m14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
 JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
 CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
 2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
 W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
 Y2ka0xkIwI1lw4CEc2x0rVAKj4xxMxkIecxEwVCm-wCF04k20xvY0x0EwIxGrwCFx2IqxV
 CFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r10
 6r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxV
 WUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG
 6rWUJVWrZr1UMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr
 0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUWUDXUUUUU=
X-CM-SenderInfo: 5zdqw4phlg00vjodqt5zlqxuoofrz/
X-Mailman-Approved-At: Thu, 20 Oct 2022 12:33:17 +0200
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 ckeepax@opensource.cirrus.com, tanureal@opensource.cirrus.com,
 liweilei@awinic.com, tiwai@suse.com, zhaolei@awinic.com, cy_huang@richtek.com,
 yijiangtao@awinic.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 quic_potturu@quicinc.com
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

Hi: Mark Brown

Thank you for your suggestion. I will fix the problem you raised in the next
patch, but there is still a question here and I want to discuss it with you

This is rather too big to go through in one go so the review here is very
high level but that's probably a good level for initial review here as there
are a lot of stylistic and structural problems.  This doesn't really look
like a Linux driver, it's not following the standard patterns or using
standard frameworks in normal ways.

It'd be good for you to look at how other drivers for similar devices are
implemented and ensure that this driver looks similar, where a driver does
something very different to other drivers that's usually a sign there's
something up.

> ---
>  sound/soc/codecs/Kconfig                        |   10 +
>  sound/soc/codecs/Makefile                       |    4 +
>  sound/soc/codecs/aw883xx/aw883xx.c              | 2734
+++++++++++++++++++++++
>  sound/soc/codecs/aw883xx/aw883xx.h              |  213 ++
>  sound/soc/codecs/aw883xx/aw883xx_bin_parse.c    | 1392 ++++++++++++
>  sound/soc/codecs/aw883xx/aw883xx_bin_parse.h    |  145 ++
>  sound/soc/codecs/aw883xx/aw883xx_calib.c        | 2534
+++++++++++++++++++++
>  sound/soc/codecs/aw883xx/aw883xx_calib.h        |  154 ++
>  sound/soc/codecs/aw883xx/aw883xx_data_type.h    |  157 ++
>  sound/soc/codecs/aw883xx/aw883xx_device.c       | 1734 ++++++++++++++
>  sound/soc/codecs/aw883xx/aw883xx_device.h       |  557 +++++
>  sound/soc/codecs/aw883xx/aw883xx_init.c         |  649 ++++++
>  sound/soc/codecs/aw883xx/aw883xx_log.h          |   32 +
>  sound/soc/codecs/aw883xx/aw883xx_monitor.c      | 1197 ++++++++++
>  sound/soc/codecs/aw883xx/aw883xx_monitor.h      |  167 ++
>  sound/soc/codecs/aw883xx/aw883xx_pid_2049_reg.h | 2388
++++++++++++++++++++
>  sound/soc/codecs/aw883xx/aw883xx_spin.c         |  807 +++++++
>  sound/soc/codecs/aw883xx/aw883xx_spin.h         |   80 +
>  18 files changed, 14954 insertions(+)

This should as I previously suggested probably be split into multiple
patches, adding the build integration at the end to preserve bisection.

Answer: I modified and sent the patch to patch v3 as required

> +#define AW883XX_DRIVER_VERSION "v1.3.0"

The versioning for the overall kernel is enough, we don't track versions for
individual drivers.

Answer: I will fix this problem in patch v3.

> +static unsigned int g_aw883xx_dev_cnt; static 
> +DEFINE_MUTEX(g_aw883xx_lock); static struct aw_container 
> +*g_awinic_cfg;

If you're using globals there's something wrong with your driver design,
everything should be working with the driver data.

Answer: I will not use global variables in patch v3

> +static const char *const aw883xx_switch[] = {"Disable", "Enable"};

Simple on/off switches should be normal Switch controls not enums.

Answer: I will fix this problem in patch v3.

> +static int aw883xx_platform_init(struct aw883xx *aw883xx) { #ifdef 
> +AW_QCOM_PLATFORM
> +	aw883xx->aw_pa->platform = AW_QCOM;
> +	return 0;
> +#elif defined AW_MTK_PLATFORM
> +	aw883xx->aw_pa->platform = AW_MTK;
> +	return 0;
> +#elif defined AW_SPRD_PLATFORM
> +	aw883xx->aw_pa->platform = AW_SPRD;
> +	return 0;
> +#else
> +	return -EINVAL;
> +#endif
> +}

This is not how we do configuration for platforms in Linux, we build single
kernel images that support multiple systems so build time configuration
really doesn't work, and in any case selecting by SoC vendor isn't going to
account for how people design their individual boards.  The driver should
use some combination of DT and ACPI to figure out whatever configuration it
needs, though a lot of what's here looks like it should just be in the
machine driver.  The driver for a device should just support that device.

Answer: I will fix this problem in patch v3.

> +/*
> + * aw883xx append suffix sound channel information  */ static void 
> +*aw883xx_devm_kstrdup(struct device *dev, char *buf) {
> +	char *str = NULL;
> +
> +	str = devm_kzalloc(dev, strlen(buf) + 1, GFP_KERNEL);
> +	if (!str)
> +		return str;
> +	memcpy(str, buf, strlen(buf));
> +	return str;
> +}

This is just devm_kstrdup().

Answer: I will fix this problem in patch v3.

> +/*
> + * aw883xx distinguish between codecs and components by version  */ 
> +#ifdef AW_KERNEL_VER_OVER_4_19_1

Don't include any support for old kernels in upstream submissions.

Answer: I will fix this problem in patch v3.

> +int aw883xx_i2c_writes(struct aw883xx *aw883xx,
> +		uint8_t reg_addr, uint8_t *buf, uint16_t len) {
> +	int ret = -1;
> +	uint8_t *data = NULL;
> +
> +	data = kmalloc(len + 1, GFP_KERNEL);
> +	if (data == NULL)
> +		return -ENOMEM;
> +
> +	data[0] = reg_addr;
> +	memcpy(&data[1], buf, len);
> +
> +	ret = i2c_master_send(aw883xx->i2c, data, len + 1);

I can't see why this isn't just using regmap.  All the actual I/O appears to
be via a 16 bit regmap.

Answer: I will fix this problem in patch v3.

> +/*
> + * aw883xx interrupt
> + */
> +static void aw883xx_interrupt_work(struct work_struct *work) {
> +	struct aw883xx *aw883xx = container_of(work,
> +				struct aw883xx, interrupt_work.work);
> +	int16_t reg_value = 0;
> +	int ret = -1;
> +
> +	aw_dev_info(aw883xx->dev, "enter");

The driver should be quiet in normal operation unless thre is some error or
it's reading back identifying information from the hardware.

Answer: I will fix this problem in patch v3.

> +	/*read reg value*/
> +	ret = aw883xx_dev_get_int_status(aw883xx->aw_pa, &reg_value);
> +	if (ret < 0)
> +		aw_dev_err(aw883xx->dev, "get init_reg value failed");
> +	else
> +		aw_dev_info(aw883xx->dev, "int value 0x%x", reg_value);
> +
> +	/*clear init reg*/
> +	aw883xx_dev_clear_int_status(aw883xx->aw_pa);
> +
> +	/*unmask interrupt*/
> +	aw883xx_dev_set_intmask(aw883xx->aw_pa, true); }

This doesn't actually do anything with the interrupt?

Answer: I will fix this problem in patch v3.

> +static int aw883xx_set_fmt(struct snd_soc_dai *dai, unsigned int fmt) 
> +{
> +	aw_snd_soc_codec_t *codec = aw883xx_get_codec(dai);
> +
> +	aw_dev_info(codec->dev, "fmt=0x%x", fmt);
> +
> +	return 0;
> +}

Remove empty functions, that includes that only log information.

Answer: I will fix this problem in patch v3.

> +static int aw883xx_mute(struct snd_soc_dai *dai, int mute, int 
> +stream) {
> +	aw_snd_soc_codec_t *codec = aw883xx_get_codec(dai);
> +	struct aw883xx *aw883xx =
> +		aw_componet_codec_ops.codec_get_drvdata(codec);
> +
> +	aw_dev_info(aw883xx->dev, "mute state=%d", mute);
> +
> +	if (stream != SNDRV_PCM_STREAM_PLAYBACK) {
> +		aw_dev_info(aw883xx->dev, "capture");
> +		return 0;
> +	}
> +
> +	if (mute) {
> +		aw883xx->pstream = AW883XX_STREAM_CLOSE;
> +		cancel_delayed_work_sync(&aw883xx->start_work);
> +		mutex_lock(&aw883xx->lock);
> +		aw883xx_device_stop(aw883xx->aw_pa);
> +		mutex_unlock(&aw883xx->lock);
> +	} else {
> +		aw883xx->pstream = AW883XX_STREAM_OPEN;
> +		mutex_lock(&aw883xx->lock);
> +		aw883xx_start(aw883xx, AW_ASYNC_START);
> +		aw883xx_hold_dsp_spin_st(&aw883xx->aw_pa->spin_desc);
> +		mutex_unlock(&aw883xx->lock);
> +	}

This doesn't look like a mute operation, it looks like it's starting and
stopping the DSP.

Answer: This is a mute operation ,aw883xx_device_stop is called in th
aw883xx_mute function. This function not only executes the mute function
aw883xx_dev_mute, but also disables dsp and power down. This is for the
aw883xx chip low power optimization.

> +static int aw883xx_dai_drv_append_suffix(struct aw883xx *aw883xx,
> +				struct snd_soc_dai_driver *dai_drv,
> +				int num_dai)

I can't tell what all this append_suffix() stuff is supposed to do but it
should probably be removed, if this is about distinguishing multiple devices
then the core already has support for that which should be used instead.

Answer:I will delete this part in patch v3

> +static int aw883xx_set_fade_in_time(struct snd_kcontrol *kcontrol,
> +	struct snd_ctl_elem_value *ucontrol) {
> +	struct soc_mixer_control *mc =
> +		(struct soc_mixer_control *)kcontrol->private_value;
> +
> +	if ((ucontrol->value.integer.value[0] > mc->max) ||
> +		(ucontrol->value.integer.value[0] < mc->min)) {
> +		aw_pr_dbg("set val %ld overflow %d or  less than :%d",
> +			ucontrol->value.integer.value[0], mc->max, mc->min);
> +		return 0;
> +	}
> +	aw883xx_dev_set_fade_time(ucontrol->value.integer.value[0], true);
> +
> +	aw_pr_dbg("step time %ld", ucontrol->value.integer.value[0]);
> +	return 0;
> +}

If a control write changes a value it should return 1, you should run the
mixer-test selftest which will identify this and a number of other issues.

Answer: Could you tell me what is mixer-test selftest? I have checked other
drivers, and there is no return 1.

> +static int aw883xx_request_firmware_file(struct aw883xx *aw883xx) {
> +	const struct firmware *cont = NULL;
> +	struct aw_container *aw_cfg = NULL;
> +	int ret = -1;
> +	int i;
> +
> +	aw883xx->aw_pa->fw_status = AW_DEV_FW_FAILED;
> +
> +	for (i = 0; i < AW_REQUEST_FW_RETRIES; i++) {
> +		ret = request_firmware(&cont, AW883XX_ACF_FILE,
aw883xx->dev);

Why are there retries here?  Other drivers that load firmware don't do that,
and if it's required I'd expect the firmware framework to do it rather than
have individual drivers open code it.

Answer: I'll remove the retry code, and fix this problem in patch v3.

> +static void aw883xx_fw_wrok(struct work_struct *work) {

wrok?

Answer: I will fix this problem in patch v3.

> +static void aw883xx_load_fw(struct aw883xx *aw883xx) { #ifdef 
> +AW_SYNC_LOAD
> +		/*sync loading*/
> +		aw883xx_request_firmware_file(aw883xx);
> +#else
> +		/*async loading*/
> +		queue_delayed_work(aw883xx->work_queue,
> +				&aw883xx->acf_work,
> +
msecs_to_jiffies(AW883XX_LOAD_FW_DELAY_TIME));
> +#endif

Why would this be a build time configuration?

Answer: I will fix this problem in patch v3.

> +/* flag addr_bytes data_bytes reg_num reg_addr*/ static int 
> +aw883xx_awrw_parse_buf(struct aw883xx *aw883xx, const char *buf, 
> +size_t count) {

Remove all these sysfs APIs, they appear to be a combination of open coding
features you shuld get from regmap and providing audio controls which should
go via the ALSA API.

Answer: I will fix this problem in patch v3.

> +#define BigLittleSwap16(A)	((((uint16_t)(A) & 0xff00) >> 8) | \
> +				 (((uint16_t)(A) & 0x00ff) << 8))
> +
> +#define BigLittleSwap32(A)	((((uint32_t)(A) & 0xff000000) >> 24) | \
> +				(((uint32_t)(A) & 0x00ff0000) >> 8) | \
> +				(((uint32_t)(A) & 0x0000ff00) << 8) | \
> +				(((uint32_t)(A) & 0x000000ff) << 24))

Don't open code stuff like this, use the standard kernel interfaces and use
naming styles that follow the kernel coding style.

Answer: I will fix this problem in patch v3.

> +static int aw_check_data_version(struct aw_bin *bin, int bin_num) {
> +	int i = 0;
> +
> +	DBG("enter\n");

Use the kernel logging framework (though as previously indicated you
shouldn't be logging noise like this).

Answer: I will delete this part in patch v3.

> +static void aw_fs_write(struct file *file, char *buf, size_t count, 
> +loff_t *pos) { #ifdef AW_KERNEL_VER_OVER_5_4_0
> +	kernel_write(file, buf, count, pos); #else
> +	vfs_write(file, buf, count, pos);
> +#endif
> +}

It is extremely worrying to see filesystem operations in a CODEC driver,
this needs a very clear explanation as to what it's doing and why.

Answer: I will delete this part in patch v3.


